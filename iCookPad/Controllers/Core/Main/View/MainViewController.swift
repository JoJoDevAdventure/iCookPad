//
//  MainViewController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 15/05/2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - View Model
    let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
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
    
    // MARK: - Network Manager calls
    
    // MARK: - Functions
    
}
// MARK: - Extensions
