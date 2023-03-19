//
//  StorageViewModel.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/19.
//

import Foundation
import Combine

final class StorageViewModel: ObservableObject {
    private let service: JuiceServiceProtocol
    @Published var juiceStock: [Fruit : Int]
    private var cancelable = Set<AnyCancellable>()

    init(service: JuiceServiceProtocol) {
        self.service = service
        self.juiceStock = service.stock
    }
}
