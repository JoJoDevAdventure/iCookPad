//
//  RecipeModel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 18/05/2022.
//

import Foundation

struct ApiResponse : Decodable {
    var recipes : [Recipe]
}

struct Recipe: Decodable {
    var id: Int
    var title: String
    var image: String
    var readyInMinutes: Int
    var healthScore: Double
    var spoonacularScore: Double?
    var pricePerServing: Double
    var vegan: Bool
    var extendedIngredients: [ExtendedIngredients]
    var weightWatcherSmartPoints: Int
    var summary: String
    var difficulty: Int?
}

struct ExtendedIngredients: Decodable {
    var aisle: String?
    var amount: Double?
    var consitency: String?
    var id: Int
    var image: String
    var measures: Measures
    var meta: [String]
    var original: String
    var originalName: String
}

struct Measures: Decodable {
    var metric: MeasuresType
}

struct MeasuresType: Decodable {
    var amount: Double
    var unitLong: String
    var unitShort: String
}
