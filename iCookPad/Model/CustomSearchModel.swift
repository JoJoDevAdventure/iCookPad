//
//  CustomSearchModel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 02/06/2022.
//

import Foundation

struct CustomSearch {
    var origin : [String : Origin] = ["":.na]
    var type : [String : TypeOfMeal] = ["":.na]
    var diet : [String : Diet] = ["":.na]
    var glutenFree : [String: Bool] = ["": false]
    var vegetarian : [String: Bool] = ["": false]
    var vegan : [String: Bool] = ["": false]
}

enum Origin: CaseIterable {
    
    case na, african, american, chinese, french, indian, italian, japanese, thai
    
    var description: String {
        switch self {
        case .na:
            return "N/A"
        case .african:
            return "African"
        case .american:
            return "American"
        case .chinese:
            return "Chinese"
        case .french:
            return "French"
        case .indian:
            return "Indian"
        case .italian:
            return "Italian"
        case .japanese:
            return "Japanese"
        case .thai:
            return "Thai"
        }
    }
    
    var allOrigins: [String] {
        var origins = [String]()
        self.description.forEach({origins.append($0.description)})
        return origins
    }
}

enum TypeOfMeal: CaseIterable {
    case na, breakfast, lunch, soup, salad, dessert, snack, beverage, drink
    
    var description: String {
        switch self {
            
        case .na:
            return "N/A"
        case .breakfast:
            return "Breakfast"
        case .lunch:
            return "Lunch"
        case .soup:
            return "Soup"
        case .salad:
            return "Salad"
        case .dessert:
            return "Dessert"
        case .snack:
            return "Snack"
        case .beverage:
            return "Beverage"
        case .drink:
            return "Drink"
        }
    }
    
    var allTypes: [String] {
        var types = [String]()
        self.description.forEach({types.append($0.description)})
        return types
    }
}

enum Diet: CaseIterable {
    case na, ketogenic, pescetarian, paleo, primal, lowFODMAP, whole30
    
    var description: String {
        switch self {
        case .na:
            return "N/A"
        case .ketogenic:
            return "ketogenic"
        case .pescetarian:
            return "pescetarian"
        case .paleo:
            return "paleo"
        case .primal:
            return "primal"
        case .lowFODMAP:
            return "lowFODMAP"
        case .whole30:
            return "whole30"
        }
    }
    
    var allTypes: [String] {
        var types = [String]()
        self.description.forEach({types.append($0.description)})
        return types
    }
}
