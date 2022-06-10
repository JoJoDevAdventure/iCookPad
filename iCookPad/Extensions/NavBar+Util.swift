//
//  NavBar+Util.swift
//  iCookPad
//
//  Created by Youssef Bhl on 31/05/2022.
//

import Foundation
import UIKit

extension UINavigationController {
    
    public func largeTitle() {
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationBar.tintColor = UIColor.LabelColors.mainTitleColor
        self.navigationBar.backgroundColor = UIColor.BackgroundColors.background
        self.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.LabelColors.mainTitleColor, .font: UIFont.systemFont(ofSize: 60, weight: UIFont.Weight.bold) ]
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.LabelColors.mainTitleColor, .font: UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)]
        self.navigationBar.barTintColor = UIColor.BackgroundColors.background
    }
    
}
