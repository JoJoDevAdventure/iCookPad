//
//  MainTabController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 15/05/2022.
//

import UIKit

class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        var vcs: [UINavigationController] = []
        TabBarModel.allCases.forEach { item in
            let vc = UINavigationController(rootViewController: item.viewController)
            vc.tabBarItem.image = UIImage(systemName: item.iconName)
            vc.title = item.title
            vcs.append(vc)
        }
        setViewControllers(vcs, animated: true)
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.backgroundColor = UIColor.BackgroundColors.background
        tabBar.barTintColor = UIColor.BackgroundColors.background
    }
}
