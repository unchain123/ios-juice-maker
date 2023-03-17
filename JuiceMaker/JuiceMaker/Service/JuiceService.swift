//
//  JuiceService.swift
//
//  Created by unchain on 2023/03/17.
//


import Foundation

protocol JuiceServieProtocol {
    var stock: [Fruit: Int] { get }
    var juices: [Juice] { get }

    func plusStock(fruit: Fruit)
    func minusStock(fruit: Fruit)
    func addNewJuice(_ juice: Juice)
    func makeJuice(_ juice: Juice) -> Result<Juice, MakeJuiceError>
    func changeStock(_ newStock: [Fruit: Int])
    func isEnoughStock(juice: Juice) -> Bool
}

final class JuiceService: ObservableObject {
    @Published var stock: [Fruit: Int]
    @Published var juices: [Juice]

    init(stock: [Fruit : Int] = [.strawberry: 10,
                                 .apple: 10,
                                 .banana: 10,
                                 .watermelon: 10,
                                 .mango: 10,
                                 .kiwi: 10],
         juices: [Juice] = [Juice(name: "딸기 주스", recipe: Recipe(ingredient: [.strawberry: 5])),
                            Juice(name: "사과 주스", recipe: Recipe(ingredient: [.apple: 3])),
                            Juice(name: "바나나 주스", recipe: Recipe(ingredient: [.banana: 4])),
                            Juice(name: "수박 주스", recipe: Recipe(ingredient: [.watermelon: 1])),
                            Juice(name: "망고주스", recipe: Recipe(ingredient: [.mango: 6])),
                            Juice(name: "키위주스", recipe: Recipe(ingredient: [.kiwi: 2]))]
    ) {
        self.stock = stock
        self.juices = juices
    }

    func plusStock(fruit: Fruit) {
        guard let count = stock[fruit] else { return }
        stock[fruit] = count + 1
    }

    func minusStock(fruit: Fruit) {
        guard let count = stock[fruit] else { return }
        stock[fruit] = count - 1
    }

    func addNewJuice(_ juice: Juice) {
        juices.append(juice)
    }

    func makeJuice(_ juice: Juice) -> Result<Juice, MakeJuiceError> {

        for ingredient in juice.recipe.ingredient {
            guard let count = stock[ingredient.key] else {
                return .failure(.wrongFruit)
            }

            if count < ingredient.value {
                return .failure(.outOfStock)
            }

            stock[ingredient.key] = count - ingredient.value
        }
        return .success(juice)
    }

    func changeStock(_ newStock: [Fruit: Int]) {
        self.stock = stock
    }

    func isEnoughStock(juice: Juice) -> Bool {
        var isEnough: Bool = true

        for (fruit, amount) in juice.recipe.ingredient {
            if isEnough {
                isEnough = stock[fruit] ?? 0 >= amount
            }
        }
        return isEnough
    }
}
