//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Kiwi, unchain123 on 2022/04/26.
//

import Foundation

enum MakeJuiceError: Error {
    case outOfStock
    case wrongFruit

    var description: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        case .wrongFruit:
            return "잘못된 과일이에요"
        }
    }
}
