//
//  Recipe.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/17.
//

import Foundation

class Recipe {
  init(ingredient: [Fruit : Int]) {
    self.ingredient = ingredient
  }

  var ingredient: [Fruit: Int]
}
