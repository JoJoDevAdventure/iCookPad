//
//  ToDoListViewController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 15/05/2022.
//

import UIKit

class ToDoListViewController: UIViewController {

    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table
        return table
    }()
    
    // MARK: - View Model
    let viewModel: ToDoListViewModel
    
    init(viewModel: ToDoListViewModel) {
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
