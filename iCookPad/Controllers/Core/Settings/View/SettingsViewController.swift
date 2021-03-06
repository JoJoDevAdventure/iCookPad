//
//  SettingsViewController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 15/05/2022.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties
    
    
    // MARK: - View Model
    let viewModel: SettingViewModel
    
    init(viewModel: SettingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Set up
    
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls
    

}
// MARK: - Extensions
