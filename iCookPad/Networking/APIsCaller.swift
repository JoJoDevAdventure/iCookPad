//
//  APIsManager.swift
//  iCookPad
//
//  Created by Youssef Bhl on 18/05/2022.
//

import Foundation

protocol TheKitchenAPICaller {
    func getOneRandomRecipe(completion: @escaping (Result<Recipe, Error>) -> Void)
    func getRandomSaltyRecipe(completion: @escaping (Result<[Recipe], Error>) -> Void)
    func getRandomSweetRecipe(completion: @escaping (Result<[Recipe], Error>) -> Void)
    func getCustomSearchResult(customSearch: CustomSearch, completion: @escaping (Result<[ComplexRecipe], Error>) -> Void)
}

class APIsCaller: TheKitchenAPICaller {

    init() {}
    
    let informations = APIInformations()
    //&tags=vegetarian,dessert
    //call to get a random recipe
    func getOneRandomRecipe(completion: @escaping (Result<Recipe, Error>) -> Void) {
        let urlString = "\(informations.baseUrl)\(informations.randomRecipe)\(informations.apiKeyUrlBase)\(informations.apiKey)&number=1"
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
    
    func getRandomSaltyRecipe(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let urlString = "\(informations.baseUrl)\(informations.randomRecipe)\(informations.apiKeyUrlBase)\(informations.apiKey)&number=5&tags=lunch"
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
                let recipes = results.recipes
                completion(.success(recipes))
            } catch {
                completion(.failure(error))
            }

        }
        task.resume()
    }
    
    func getRandomSweetRecipe(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let urlString = "\(informations.baseUrl)\(informations.randomRecipe)\(informations.apiKeyUrlBase)\(informations.apiKey)&number=5&tags=sweet"
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
                let recipes = results.recipes
                completion(.success(recipes))
            } catch {
                completion(.failure(error))
            }

        }
        task.resume()
    }
    
    func getCustomSearchResult(customSearch: CustomSearch,completion: @escaping (Result<[ComplexRecipe], Error>) -> Void) {
        var urlString = "\(informations.baseUrl)\(informations.complexSearch)\(informations.apiKeyUrlBase)\(informations.apiKey)"
        if let diet = customSearch.diet {
            urlString += diet
        }
        if let origin = customSearch.origin {
            urlString += origin
        }
        if let type = customSearch.type {
            urlString += type
        }
        if customSearch.tags != "&tags=" {
            urlString += customSearch.tags!
        }
        urlString += "&number=8"
        
        print(urlString)
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data else {
                return
            }
            guard error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(ComplexRecipeResponse.self, from: data)
                let recipes = results.results
                completion(.success(recipes))
            } catch {
                completion(.failure(error))
            }

        }
        task.resume()
    }
    
    func fromComplexToRecipe(complexRecipes: [ComplexRecipe]) async throws {
        let urlToId = "https://api.spoonacular.com/recipes/716429/information?includeNutrition=false"
    }

}
