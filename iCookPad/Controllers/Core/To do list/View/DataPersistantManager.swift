//
//  CoreDataManager.swift
//  iCookPad
//
//  Created by Youssef Bhl on 10/06/2022.
//

import Foundation
import UIKit
import CoreData

protocol DPInsertionService {
    func downloadRecipeWith(model: Recipe, completion: @escaping (Result<Void, Error>) -> Void)
}


class DataPersistantManager: DPInsertionService {
    
    static let shared = DataPersistantManager()
    
    //CoreData : Insert into Local
    func downloadRecipeWith(model: Recipe, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(.failure(DBError.invalidAppDelegate))
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = model.toItem(context: context)
        
        guard let imageURLString = model.image, let imageURL = URL(string: imageURLString) else {
            completion(.failure(DBError.invalidImageURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                // Save the image to local storage
                let imagePath = self.getDocumentsDirectory().appendingPathComponent("\(model.id).jpg")
                
                do {
                    try image.jpegData(compressionQuality: 1.0)?.write(to: imagePath)
                    item.localImageUrl = imagePath.absoluteString // Update the RecipeItem with local image URL
                    try context.save()
                    completion(.success(()))
                } catch {
                    completion(.failure(DBError.failedToSaveImage))
                }
            } else {
                completion(.failure(DBError.invalidImageData))
            }
        }
        
        task.resume()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
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
    func deleteRecipeWith(model : RecipeItem, completion: @escaping (Result<Void, Error>) -> Void) {
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
    
    func deleteAllRecipes(items: [RecipeItem],completion: @escaping (Result<Void, Error>) -> Void) {
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
