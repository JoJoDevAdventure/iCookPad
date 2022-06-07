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
        
        let request = AF.request(urlString)
        var complexRecipes = [ComplexRecipe]()
        var recipes = [Recipe]()
        request.validate().responseDecodable(of: ComplexRecipeResponse.self) { [self] (response) in
            
            guard let apiResponse = response.value else { return }
            complexRecipes = apiResponse.results
            for complexRecipe in complexRecipes {
                let srequest = AF.request("https://api.spoonacular.com/recipes/\(complexRecipe.id)/information?\(self.informations.apiKeyUrlBase)\(informations.apiKey)&includeNutrition=false")
                srequest.validate().responseDecodable(of: Recipe.self) { response in
                    guard let recipe = response.value else {
                        return
                    }
                    recipes.append(recipe)
                    completion(.success(recipes))
                }
            }
        }
    
    }
        
}
