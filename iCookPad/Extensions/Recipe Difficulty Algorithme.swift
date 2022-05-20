//
//  Recipe Difficulty Algorithme.swift
//  iCookPad
//
//  Created by Youssef Bhl on 20/05/2022.
//

import Foundation

struct DifficultyProperty {
    func calculateDifficulty(recipe: Recipe) -> Int {
        let steps = Double(recipe.extendedIngredients.count)
        let prepTime = Double(recipe.readyInMinutes)
        let coast = recipe.pricePerServing
        //difficulty calcul :
        /*
         property in calcul : number of steps, coast, prep time
         return should be 1 / 2 / 3 / 4 / 5 / 6
         1 : low steps (2) / coast (7$) / preptime(5min) = 5
         6 : mac steps (16) / coast (400$) / preptime (120 min) = 50
         mesure = step coast per minute
         (coast * step) / min
         
         1//       < 13.3
         2// 13.3 -> 21.6
         3// 21.6 -> 29.9
         4// 29.9 -> 38.2
         5// 38.2 -> 46.5
         6// 46.5 >
         */
        let setupCoastPerMinute = (steps * coast) / prepTime
        return 0
    }
}
