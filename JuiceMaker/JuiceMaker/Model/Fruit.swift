//
//  Fruits.swift
//  JuiceMaker
//
//  Created by Kiwi, unchain123 on 2022/04/26.
//

enum Fruit: String, CaseIterable, Comparable {
    static func < (lhs: Fruit, rhs: Fruit) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

  case strawberry
  case apple
  case watermelon
  case banana
  case mango
  case peach
  case kiwi

  var icon: String {
    switch self {
    case .strawberry:
      return "🍓"
    case .apple:
      return "🍏"
    case .watermelon:
      return "🍉"
    case .banana:
      return "🍌"
    case .mango:
      return "🥭"
    case .peach:
      return "🍑"
    case .kiwi:
      return "🥝"
    }
  }
}

