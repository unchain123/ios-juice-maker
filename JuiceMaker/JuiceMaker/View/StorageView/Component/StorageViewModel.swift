//
//  StorageViewModel.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/19.
//

import Foundation
import Combine

final class StorageViewModel: ObservableObject {
    var service: JuiceServiceProtocol
    @Published var juiceStock: [Fruit : Int]
    var childrenVieModel: [Fruit : StockControlViewModel]
    private var cancelable = Set<AnyCancellable>()

    init(service: JuiceServiceProtocol) {
        self.service = service
        self.juiceStock = service.stock
        self.childrenVieModel = [:]

        for fruit in juiceStock {
            let children = StockControlViewModel(fruit: fruit.key, count: fruit.value)
            childrenVieModel[fruit.key] = children
        }
        stockCount()
    }

    func stockCount() {
        for viewModel in childrenVieModel {
            childrenVieModel[viewModel.key]?.$count
                .sink(receiveValue: { [weak self] count in
                    guard let self = self else { return }
                    self.juiceStock[viewModel.key] = count
                }).store(in: &cancelable)
        }
    }

    func saveStock() {
        $juiceStock
            .sink { [weak self] changedStock in
                self?.service.changeStock(changedStock)
            }.store(in: &cancelable)
    }
}
