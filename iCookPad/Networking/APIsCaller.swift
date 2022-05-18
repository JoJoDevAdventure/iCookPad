//
//  APIsManager.swift
//  iCookPad
//
//  Created by Youssef Bhl on 18/05/2022.
//

import Foundation

protocol TheKitchenAPICaller {
    
}

class APIsCaller: TheKitchenAPICaller {

    init() {}
    
    let informations = APIInformations()
    
    //call to get a random recipe
    func getOneRandomRecipe() {
        let urlString = informations.apiKeyUrlBase + informations.
        guard let url = URL(string: <#T##String#>)
    }
    
}
