//
//  TheKitchedViewModel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import Foundation

protocol TheKitchedViewModelOutPut: AnyObject {
    func gotRandRecipe(recipe: Recipe)
    func showErrorMessage(error: Error)
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
                self?.output?.showErrorMessage(error: error)
            }
        }
    }
    
}
