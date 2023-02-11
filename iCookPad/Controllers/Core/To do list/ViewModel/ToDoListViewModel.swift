//
//  ToDoListViewModel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 15/05/2022.
//

import Foundation
protocol ToDoListViewModelOutput {
    func didLoadLocalRecipes(recipes: [RecipeItem])
    func failedToLoadRecipes(error: Error)
    func didDeleteRecipe()
    func failedToDeleteRecipe(error: Error)
}

class ToDoListViewModel {
    
    public var output: ToDoListViewModelOutput?
    
    init() {
        //TODO: Implement integration for LocalDataManager
    }
    
    public func fetchLocalStorageForDownload() {
        DataPersistantManager.shared.fetchingTitlesFromDatabase { [weak self] result in
            switch result {
            case .success(let recipes):
                DispatchQueue.main.async {
                    self?.output?.didLoadLocalRecipes(recipes: recipes)
                }
            case.failure(let error) :
                self?.output?.failedToLoadRecipes(error: error)
            }
        }
    }
    
    public func deleteRecipe(recipe: RecipeItem) {
        DataPersistantManager.shared.deleteRecipeWith(model: recipe) {[weak self] results in
            switch results {
            case .success():
                self?.output?.didDeleteRecipe()
            case .failure(let error):
                self?.output?.failedToDeleteRecipe(error: error)
            }
        }
    }
    
    
}
