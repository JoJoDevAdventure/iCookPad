//
//  RecipeModel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 18/05/2022.
//

import Foundation

//api response model
struct ApiResponse : Decodable {
    var recipes : [Recipe]
}

// recipe model
struct Recipe: Decodable {
    var id: Int?
    var title: String?
    var image: String?
    var readyInMinutes: Int
    var healthScore: Double?
    var spoonacularScore: Double?
    var pricePerServing: Double?
    var vegan: Bool?
    var extendedIngredients: [ExtendedIngredients]?
    var weightWatcherSmartPoints: Int?
    var summary: String?
    var difficulty: Int?
}

//steps model
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

//measures model
struct Measures: Decodable {
    var metric: MeasuresType
}

//measures type
struct MeasuresType: Decodable {
    var amount: Double
    var unitLong: String
    var unitShort: String
}

struct ComplexRecipeResponse : Decodable {
    var results: [ComplexRecipe]
}

struct ComplexRecipe: Decodable {
    var id : Int
    var title : String
    var image : String
    var imageType: String
}
