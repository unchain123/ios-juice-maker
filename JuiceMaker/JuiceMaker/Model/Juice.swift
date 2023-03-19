//
//  Juice.swift
//  JuiceMaker
//
//  Created by kiwi, unchain123 on 2022/04/26.
//

import Foundation

struct Juice: Identifiable {
    let id = UUID()

    var name: String
    let recipe: Recipe
    let color: String

    init(name: String, recipe: Recipe, color: String = "") {
        self.name = name
        self.recipe = recipe
        self.color = color
    }
}
