//
//  Recipe Difficulty Algorithme.swift
//  iCookPad
//
//  Created by Youssef Bhl on 20/05/2022.
//

import Foundation

//calculating difficulty
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
         6 : mac steps (12) / coast (200$) / preptime (120 min) = 50
         mesure = step coast per minute
         (coast * step) / min
         
         1// < 2.5
         2// 2.5 -> 5.625
         3// 5.625 -> 11.25
         4// 11.25 -> 16.875
         5// 16.875 -> 20
         6// > 20
         */
        let setupCoastPerMinute = (steps * coast) / prepTime
        switch setupCoastPerMinute {
        case 0 ... 3.5 : return 1
        case 3.5 ... 7 : return 2
        case 7 ... 12.75 : return 3
        case 12.75 ... 18 : return 4
        case 18 ... 22 : return 5
        default :
            return 6
        }
    }
}
