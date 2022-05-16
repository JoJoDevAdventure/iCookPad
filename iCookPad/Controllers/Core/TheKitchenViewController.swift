//
//  TheKitchenViewController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import UIKit

class TheKitchenViewController: UIViewController {
    
    // MARK: - Properties
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
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
        setupNavBar()
        setupSubviews()
    }
    
    // MARK: - Set up
    
    private func setupNavBar() {
        title = "iCookBook"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor.BackgroundColors.background
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.LabelColors.mainTitleColor, .font: UIFont.systemFont(ofSize: 68, weight: UIFont.Weight.bold) ]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.LabelColors.mainTitleColor, .font: UIFont.systemFont(ofSize: 38, weight: UIFont.Weight.semibold)]
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls


}
// MARK: - Extensions
