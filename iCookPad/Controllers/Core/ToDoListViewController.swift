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
        table.registerCell(ToDoTableViewCell.self)
        table.backgroundColor = UIColor.BackgroundColors.background
        table.separatorColor = .clear
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
        setupSubviews()
        setupConstraints()
        setupNavBar()
        setupTableView()
    }

    // MARK: - Set up
    
    private func setupNavBar() {
        title = "ToDo List 📝"
        navigationController?.largeTitle()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls
    
    
}
// MARK: - Extension: TableView
extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: ToDoTableViewCell.self, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}
