//
//  ColorsExtension.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import Foundation
import UIKit

extension UIColor {
    //backgrounds color
    //TODO: -dark mode
    struct BackgroundColors {
        static let background = UIColor.init(red: 255/255, green: 247/255, blue: 242/255, alpha: 1)
    }
    
    //text color
    struct LabelColors {
        static let mainTitleColor = UIColor.init(red: 70/255, green: 70/255, blue: 100/255, alpha: 1)
        static let secondLabelColor = UIColor.init(red: 29/255, green: 31/255, blue: 38/255, alpha: 1)
    }
    
    //difficulty cells colors
    struct DifficultyColors {
        static let difficulty1 = UIColor.init(red: 62/255, green: 167/255, blue: 78/255, alpha: 1)
        static let difficulty2 = UIColor.init(red: 135/255, green: 167/255, blue: 62/255, alpha: 1)
        static let difficulty3 = UIColor.init(red: 163/255, green: 167/255, blue: 62/255, alpha: 1)
        static let difficulty4 = UIColor.init(red: 167/255, green: 119/255, blue: 62/255, alpha: 1)
        static let difficulty5 = UIColor.init(red: 167/255, green: 86/255, blue: 62/255, alpha: 1)
        static let difficulty6 = UIColor.init(red: 167/255, green: 62/255, blue: 62/255, alpha: 1)
    }
}
