//
//  CustomSearchModel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 02/06/2022.
//

import Foundation

struct CustomSearch {
    
    init(origin: String, type: String, diet: String, glutenFree: Bool, vegetarian: Bool, vegan: Bool) {
        self.origin = ["cuisine=" : origin]
        self.type = ["type=" : type]
        self.diet = ["diet=" : diet]
        var tags = [String]()
        var stringTag : String = ""
        if glutenFree {
            tags.append("GlutenFree")
        } else if vegetarian {
            tags.append("vegetarian")
        } else if vegan {
            tags.append("vegan")
        }
        tags.forEach { tag in
            if stringTag == "" {
                stringTag += tag
            }
            stringTag += ",\(tag)"
        }
    }
    var origin : [String : String]? = ["cuisine=": Origin.na.description]
    var type : [String : String]? = ["type=": TypeOfMeal.na.description]
    var diet : [String : String]? = ["diet=": Diet.na.description]
    var tags : [String : String]?
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
    
    
    func getCaseFromString(name: String) -> Origin {
        for origin in Origin.allCases {
            if origin.description == name {
                return origin
            }
        }
        return .na
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
    
    func getCaseFromString(name: String) -> TypeOfMeal {
        for meal in TypeOfMeal.allCases {
            if meal.description == name {
                return meal
            }
        }
        return .na
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
    
    var allDiets: [String] {
        var types = [String]()
        self.description.forEach({types.append($0.description)})
        return types
    }
    
    func getCaseFromString(name: String) -> Diet {
        for diet in Diet.allCases {
            if diet.description == name {
                return diet
            }
        }
        return .na
    }
}
