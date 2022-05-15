//
//  MainTabControllerViewModel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 15/05/2022.
//

import Foundation
import UIKit

enum TabBarModel: CaseIterable {
    case mainView
    case todoList
    case settings

    var viewController: UIViewController {
        switch self {
        case .mainView:
            let viewModel = MainViewModel()
            let vc = MainViewController(viewModel: viewModel)
            return vc
        case .todoList:
            
        case .settings:
            <#code#>
        }
    }
    
    var title: String {
        switch self {
        case .mainView:
            <#code#>
        case .todoList:
            <#code#>
        case .settings:
            <#code#>
        }
    }
    
    var iconName: String {
        switch self {
        case .mainView:
            <#code#>
        case .todoList:
            <#code#>
        case .settings:
            <#code#>
        }
    }
    
}
