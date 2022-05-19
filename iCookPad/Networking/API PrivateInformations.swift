//
//  API PrivateInformations.swift
//  iCookPad
//
//  Created by Youssef Bhl on 18/05/2022.
//

import Foundation

struct APIInformations {
    let baseUrl = "https://api.spoonacular.com/recipes/"
    
    let apiKeyUrlBase = "information?apiKey="
    let apiKey = "5f0d16a8c0514dd39a913e5bf9802c65"
}
// example of successful api call
// https://api.spoonacular.com/recipes/random?apiKey=5f0d16a8c0514dd39a913e5bf9802c65&number=1&tags=vegetarian,dessert
