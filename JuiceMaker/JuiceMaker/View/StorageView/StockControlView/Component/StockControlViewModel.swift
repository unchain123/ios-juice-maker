//
//  StockControlViewModel.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/19.
//

import Foundation

final class StockControlViewModel: ObservableObject {
    var fruit: Fruit
    @Published var count: Int

    init(fruit: Fruit, count: Int) {
        self.fruit = fruit
        self.count = count
    }

    func minusCount() {
        guard count > 0 else { return }
        count -= 1
    }

    func plusCount() {
        count += 1
    }
}
