//
//  APIsManager.swift
//  iCookPad
//
//  Created by Youssef Bhl on 18/05/2022.
//

import Foundation

protocol TheKitchenAPICaller {
    func getOneRandomRecipe(completion: @escaping (Result<Recipe, Error>) -> Void)
}

class APIsCaller: TheKitchenAPICaller {

    init() {}
    
    let informations = APIInformations()
    
    //call to get a random recipe
    func getOneRandomRecipe(completion: @escaping (Result<Recipe, Error>) -> Void) {
        let urlString = "https://api.spoonacular.com/recipes/random?apiKey=5f0d16a8c0514dd39a913e5bf9802c65&number=1&tags=vegetarian,dessert"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data else {
                return
            }
            guard error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(ApiResponse.self, from: data)
                guard let recipe = results.recipes.first else { return }
                completion(.success(recipe))
            } catch {
                completion(.failure(error))
            }

        }
        task.resume()
    }
    
}
