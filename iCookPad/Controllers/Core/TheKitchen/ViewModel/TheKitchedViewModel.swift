//
//  TheKitchedViewModel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import Foundation

protocol TheKitchedViewModelOutPut: AnyObject {
    func gotRandRecipe(recipe: Recipe)
    func gotSweetRecipes(sweetRecipes: [Recipe])
    func gotSaltyRecipes(saltyRecipes: [Recipe])
    func gotCustomSearchRecipes(recipes: [Recipe])
    func showErrorMessageFetchingRandom(error: Error)
    func showErrorMessageFetchingSalty(error: Error)
    func showErrorMessageFetchingSweet(error: Error)
}

class TheKitchedViewModel {
//    let mock = Recipe(id: nil, title: nil, image: nil, readyInMinutes: 10, healthScore: nil, spoonacularScore: nil, pricePerServing: nil, vegan: nil, extendedIngredients: nil, weightWatcherSmartPoints: nil, summary: nil, difficulty: nil)
    
    weak var output: TheKitchedViewModelOutPut?
    let TheKitchenService: TheKitchenAPICaller
    
    init(TheKitchenService: TheKitchenAPICaller) {
        self.TheKitchenService = TheKitchenService
    }
    
    // get chief choice recipe and set it to TheChiken controller
    func getChiefChoiceRecipe() {
//        let recipe = mock
//        self.output?.gotRandRecipe(recipe: recipe)
        TheKitchenService.getOneRandomRecipe {[weak self] results in
            switch results {
            case .success(let recipe) :
                self?.output?.gotRandRecipe(recipe: recipe)
            case .failure(let error) :
                self?.output?.showErrorMessageFetchingRandom(error: error)
            }
        }
    }
    
    func getSaltySweetRecipes() {
        getSweetRecipes()
        getSaltyRecipes()
    }
    
    func getSaltyRecipes() {
//        let salty = [mock, mock, mock, mock, mock]
//        self.output?.gotSaltyRecipes(saltyRecipes: salty)
        TheKitchenService.getRandomSaltyRecipe {[weak self] results in
            switch results {
            case .success(let salty) :
                self?.output?.gotSaltyRecipes(saltyRecipes: salty)
            case .failure(let error) :
                self?.output?.showErrorMessageFetchingSalty(error: error)
            }
        }
    }
    
    func getSweetRecipes() {
//        let sweet = [mock, mock, mock, mock, mock]
//        self.output?.gotSweetRecipes(sweetRecipes: sweet)
        TheKitchenService.getRandomSweetRecipe {[weak self] results in
            switch results {
            case .success(let sweet):
                self?.output?.gotSweetRecipes(sweetRecipes: sweet)
            case .failure(let error):
                self?.output?.showErrorMessageFetchingSweet(error: error)
            }
        }
    }
    
    func getCustomSearchRecipes() {
        TheKitchenService.getCustomSearchResult { [weak self] results in
            switch results {
            case .success(let recipes) :
                self?.output?.gotCustomSearchRecipes(recipes: recipes)
            case .failure(_) : break
                
            }
        }
    }
    
}
