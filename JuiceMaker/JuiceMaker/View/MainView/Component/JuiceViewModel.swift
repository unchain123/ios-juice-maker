//
//  MainViewModel.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/17.
//

import Foundation
import Combine

final class JuiceViewModel: ObservableObject {
    private let service: JuiceServiceProtocol
    private var viewRouter: ViewRouter
    private var cancellable = Set<AnyCancellable>()
    private var juiceName = PassthroughSubject<String, Never>()
    private var storageViewModel: StorageViewModel
    @Published var juices: [Juice]

    init(service: JuiceServiceProtocol, viewRouter: ViewRouter) {
        self.service = service
        self.juices = service.juices
        self.viewRouter = viewRouter
        self.storageViewModel = StorageViewModel(service: service)
    }

    func tappedMakeButton(selected menu: Int) {
        switch service.makeJuice(juices[menu]) {
        case .success(let juice):
            self.viewRouter.juice = juice
            self.viewRouter.isShowSuccessAlert = true
        case .failure(let error):
            print(error)
        }
    }

    func isEnough(fruit: Int) -> Bool {
        let isEnoughStock = service.isEnoughStock(juice: juices[fruit])
        return isEnoughStock
    }
}
