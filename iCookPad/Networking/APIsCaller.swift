//
//  APIsManager.swift
//  iCookPad
//
//  Created by Youssef Bhl on 18/05/2022.
//

import Foundation
import Alamofire

protocol TheKitchenAPICaller {
    func getOneRandomRecipe(completion: @escaping (Result<Recipe, Error>) -> Void)
    func getRandomSaltyRecipe(completion: @escaping (Result<[Recipe], Error>) -> Void)
    func getRandomSweetRecipe(completion: @escaping (Result<[Recipe], Error>) -> Void)
    func getCustomSearchResult(customSearch: CustomSearch, completion: @escaping (Result<[Recipe], Error>) -> Void)
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
    
    func getCustomSearchResult(customSearch: CustomSearch,completion: @escaping (Result<[Recipe], Error>) -> Void) {
        var urlString = "\(informations.baseUrl)\(informations.complexSearch)\(informations.apiKeyUrlBase)\(informations.apiKey)"
        var custom = false
        if let diet = customSearch.diet {
            urlString += diet
            custom = true
        }
        if let origin = customSearch.origin {
            urlString += origin
            custom = true
        }
        if let type = customSearch.type {
            urlString += type
            custom = true
        }
        if customSearch.tags != "&tags=" {
            urlString += customSearch.tags!
            custom = true
        }
        
        if !custom {
            urlString = "\(informations.baseUrl)\(informations.randomRecipe)\(informations.apiKeyUrlBase)\(informations.apiKey)"
        }
        urlString += "&number=8"
        
        print(urlString)
        guard let url = URL(string: urlString) else { return }
        
        var recipes = [ComplexRecipe]()
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data else {
                return
            }
            guard error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(ComplexRecipeResponse.self, from: data)
                recipes = results.results
                print(recipes)
            } catch {
                completion(.failure(error))
            }

        }
        var finalRecipes = [Recipe]()
        for recipe in recipes {
            let urlId = "https://api.spoonacular.com/recipes/\(recipe.id)/information?includeNutrition=false"
            guard let url = URL(string: urlId) else { return }
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data else {
                    return
                }
                guard error == nil else {
                    return
                }

                do {
                    let results = try JSONDecoder().decode(Recipe.self, from: data)
                    finalRecipes.append(results)
                } catch {
                    completion(.failure(error))
                }

            }
            task.resume()
        }
        completion(.success(finalRecipes))
    }
}
