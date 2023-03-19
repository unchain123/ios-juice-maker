//
//  JuiceService.swift
//
//  Created by unchain on 2023/03/17.
//


import Foundation

protocol JuiceServiceProtocol {
    var stock: [Fruit: Int] { get }
    var juices: [Juice] { get }

    func plusStock(fruit: Fruit)
    func minusStock(fruit: Fruit)
    func addNewJuice(_ juice: Juice)
    func makeJuice(_ juice: Juice) -> Result<Juice, MakeJuiceError>
    func changeStock(_ newStock: [Fruit: Int])
    func isEnoughStock(juice: Juice) -> Bool
}

final class JuiceService: ObservableObject, JuiceServiceProtocol {
    @Published var stock: [Fruit: Int]
    @Published var juices: [Juice]

    init(stock: [Fruit : Int] = [.strawberry: 10,
                                 .apple: 10,
                                 .banana: 10,
                                 .watermelon: 10,
                                 .mango: 10,
                                 .kiwi: 10],
         juices: [Juice] = [Juice(name: "딸기 주스", recipe: Recipe(ingredient: [.strawberry: 5]), color: "strawberryPink"),
                            Juice(name: "사과 주스", recipe: Recipe(ingredient: [.apple: 3]), color: "appleGreen"),
                            Juice(name: "바나나 주스", recipe: Recipe(ingredient: [.banana: 4]), color: "bananaYellow"),
                            Juice(name: "수박 주스", recipe: Recipe(ingredient: [.watermelon: 1]), color: "watermelonRed"),
                            Juice(name: "망고주스", recipe: Recipe(ingredient: [.mango: 6]), color: "mangoYellow"),
                            Juice(name: "키위주스", recipe: Recipe(ingredient: [.kiwi: 2]), color: "appleGreen")]
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
