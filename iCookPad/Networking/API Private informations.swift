//
//  API Private informations.swift
//  iCookPad
//
//  Created by Youssef Bhl on 27/05/2022.
//

import Foundation

struct APIInformations {
    let baseUrl = "https://api.spoonacular.com/recipes/"
    
    let apiKeyUrlBase = "information?apiKey="
    let apiKey = "<<<Your spooncular API Here>>>"
}
// example of successful api call
// https://api.spoonacular.com/recipes/random?apiKey=[API KEY]&number=1&tags=vegetarian,dessert
