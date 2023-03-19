//
//  Recipe.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/17.
//

import Foundation

final class Recipe {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.ingredient == rhs.ingredient
    }

  init(ingredient: [Fruit : Int]) {
    self.ingredient = ingredient
  }

  var ingredient: [Fruit: Int]
}
