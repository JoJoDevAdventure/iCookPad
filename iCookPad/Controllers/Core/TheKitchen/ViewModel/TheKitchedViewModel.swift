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
    func showErrorMessageFetchingRandom(error: Error)
    func showErrorMessageFetchingSalty(error: Error)
    func showErrorMessageFetchingSweet(error: Error)
}

class TheKitchedViewModel {
    
    weak var output: TheKitchedViewModelOutPut?
    let TheKitchenService: TheKitchenAPICaller
    
    init(TheKitchenService: TheKitchenAPICaller) {
        self.TheKitchenService = TheKitchenService
    }
    
    // get chief choice recipe and set it to TheChiken controller
    func getChiefChoiceRecipe() {
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
        TheKitchenService.getRandomSweetRecipe {[weak self] results in
            switch results {
            case .success(let sweet):
                self?.output?.gotSweetRecipes(sweetRecipes: sweet)
            case .failure(let error):
                self?.output?.showErrorMessageFetchingSweet(error: error)
            }
        }
    }
    
}
