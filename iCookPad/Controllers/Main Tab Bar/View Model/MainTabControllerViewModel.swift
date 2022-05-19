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
            let service : TheKitchenAPICaller = APIsCaller()
            let viewModel = TheKitchedViewModel(TheKitchenService: service)
            let vc = TheKitchenViewController(viewModel: viewModel)
            return vc
        case .todoList:
            let viewModel = ToDoListViewModel()
            let vc = ToDoListViewController(viewModel: viewModel)
            return vc
        case .settings:
            let viewModel = SettingViewModel()
            let vc = SettingsViewController(viewModel: viewModel)
            return vc
        }
    }
    
    var title: String {
        switch self {
        case .mainView:
            return "The Kitchen"
        case .todoList:
            return "To Do"
        case .settings:
            return "Settings"
        }
    }
    
    var iconName: String {
        switch self {
        case .mainView:
            return "dial.min"
        case .todoList:
            return "decrease.indent"
        case .settings:
            return "gearshape"
        }
    }
    
}
