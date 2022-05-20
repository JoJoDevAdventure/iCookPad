//
//  Recipe Difficulty Algorithme.swift
//  iCookPad
//
//  Created by Youssef Bhl on 20/05/2022.
//

import Foundation

struct DifficultyProperty {
    func calculateDifficulty(recipe: Recipe) -> Int {
        //difficulty calcul :
        /*
         property in calcul : number of steps, coast, prep time
         return should be 1 / 2 / 3 / 4 / 5 / 6
         1 : low steps (2) / coast (7$) / preptime(5min)
         6 : mac steps (16) / coast (400$) / preptime (120 min)
         
         mesure = step coast per minute
         (coast * step) / min
         */
        return 0
    }
}
