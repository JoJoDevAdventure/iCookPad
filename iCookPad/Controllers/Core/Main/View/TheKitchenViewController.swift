//
//  TheKitchenViewController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import UIKit

class TheKitchenViewController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - View Model
    let viewModel: TheKitchedViewModel
    
    init(viewModel: TheKitchedViewModel) {
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
