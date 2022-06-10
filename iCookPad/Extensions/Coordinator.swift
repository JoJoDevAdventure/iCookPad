//
//  Coordinator.swift
//  iCookPad
//
//  Created by Youssef Bhl on 08/06/2022.
//

import Foundation
import UIKit

class Coordinator {
    
    public func goToDetailedRecipe(from: UIViewController, with recipe: Recipe) {
        let vc = DetailViewController(recipe: recipe)
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
}
