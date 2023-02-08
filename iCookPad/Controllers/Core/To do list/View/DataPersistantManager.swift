//
//  CoreDataManager.swift
//  iCookPad
//
//  Created by Youssef Bhl on 10/06/2022.
//

import Foundation
import UIKit
import CoreData

class DataPersistantManager {
    
    static let shared = DataPersistantManager()
    
    //CoreData : Insert into Local
    func downloadRecipeWith(model: Recipe, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = model.toItem(context: context)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DataBaseError.failedToSaveData))
        }
        
    }
    
    //CoreData : Fetch all
    func fetchingTitlesFromDatabase(completion: (Result<[RecipeItem], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<RecipeItem>
        
        request = RecipeItem.fetchRequest()
        
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(DataBaseError.failedToFetchData))
        }
    }
    
    //CoreData : Delete
    func deleteTitileWith(model : RecipeItem, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model) // asking database manager to delete object
        
        do {
            
            try context.save()
            completion(.success(()))
            
        } catch {
            completion(.failure(DataBaseError.failedToDelete))
        }
    }
    
    func deleteAllTitles(items: [RecipeItem],completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        for item in items {
            context.delete(item)
        }
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DataBaseError.failedToDelete))
        }
        
    }
    
}

extension DataPersistantManager {
    
    enum DataBaseError: LocalizedError {
        case failedToSaveData
        case failedToFetchData
        case failedToDelete
        
        var errorDescription: String? {
            switch self {
            case.failedToDelete :
                return "Failed to remove Recipe"
            case.failedToSaveData :
                return "Failed to save Recipe"
            case.failedToFetchData :
                return "Failed to fetch Recipe"
            }
        }
    }
    
}
