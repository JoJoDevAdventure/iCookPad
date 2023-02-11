//
//  ToDoListViewController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 15/05/2022.
//

import UIKit

class ToDoListViewController: UIViewController {

    // MARK: - Properties
    var recipes: [RecipeItem] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.registerCell(ToDoTableViewCell.self)
        table.backgroundColor = UIColor.BackgroundColors.background
        table.separatorColor = .clear
        table.isUserInteractionEnabled = true
        return table
    }()
    
    // MARK: - View Model
    let viewModel: ToDoListViewModel
    
    init(viewModel: ToDoListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
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
        view.isUserInteractionEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchData()
    }

    // MARK: - Set up
    
    private func setupNavBar() {
        title = "ToDo List 📝"
        navigationController?.largeTitle()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didPressDelete))
    }
    
    @objc private func didPressDelete() {
        AlertsManager.shared.verificationAlert(with: self, sure: "Do you want to delete all your recipes ?") { yes in
            if yes {
                self.deleteAllRecipes()
            } else {
                return
            }
        }
    }
    
    
    private func deleteAllRecipes() {
        DataPersistantManager.shared.deleteAllRecipes(items: recipes) { results in
            switch results {
            case .success(let success):
                self.recipes = []
                self.tableView.reloadData()
               return
            case .failure(let failure):
                return
            }
        }
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
    private func fetchData() {
        viewModel.fetchLocalStorageForDownload()
    }
    
    // MARK: - Network Manager calls
    
    
}
// MARK: - Extension: TableView
extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: ToDoTableViewCell.self, for: indexPath)
        let recipe = recipes[indexPath.row]
        cell.configure(recipe: recipe)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

extension ToDoListViewController: ToDoListViewModelOutput {
    func didDeleteRecipe() {
        fetchData()
    }
    
    func failedToDeleteRecipe(error: Error) {
        AlertsManager.shared.errorAlert(with: self, error: error.localizedDescription)
    }
    
    func didLoadLocalRecipes(recipes: [RecipeItem]) {
        self.recipes = recipes
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func failedToLoadRecipes(error: Error) {
        AlertsManager.shared.errorAlert(with: self, error: error.localizedDescription)
    }
    
}

extension ToDoListViewController: ToDoTableViewCellDelegate {
    
    func didPressDeleteRecipe(recipe: RecipeItem) {
        AlertsManager.shared.verificationAlert(with: self, sure: "Are you sure to delete this recipe from your ToDos?") { yes in
            yes ? self.viewModel.deleteRecipe(recipe: recipe) : ()
        }
    }
    
    func didPressArchieveRecipe(recipe: RecipeItem) {
        //TODO: Archieve
    }
    
}
