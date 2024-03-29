//
//  TheKitchenViewController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import UIKit
import Lottie

class TheKitchenViewController: UIViewController {
    
    // MARK: - Properties
    
    private var chiefChoiceRecipe: Recipe?
    private var saltyRecipes: [Recipe] = []
    private var sweetRecipes: [Recipe] = []
    private var customSearchResult: [Recipe] = []
    
    // MARK: - UI
    let doneDownloadAnimation = DoneAnimation()
    
    // TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.BackgroundColors.background
        tableView.sectionIndexColor = .clear
        tableView.separatorColor = .clear
        tableView.registerCell(MasterPieceTableViewCell.self)
        tableView.registerCell(RandomSweetySaltySectionTableViewCell.self)
        tableView.registerCell(CustomSearchTableViewCell.self)
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
    
    // MARK: - View Model
    let viewModel: TheKitchedViewModel
    
    init(viewModel: TheKitchedViewModel) {
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
        setupNavBar()
        setupSubviews()
        setupTableView()
        fetchChiefChoiceRecipe()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("reload"), object: nil, queue: nil) { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Set up
    // NavBar
    private func setupNavBar() {
        title = "iCookPad 🧑‍🍳"
        navigationController?.largeTitle()
    }
    
    // adding subview
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    // tableView delegate / datasource
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls

    // fetch recipes
    private func fetchChiefChoiceRecipe() {
        viewModel.getChiefChoiceRecipe()
        viewModel.getSaltySweetRecipes()
    }

}
// MARK: - Extension : TableView
extension TheKitchenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            let cell = tableView.dequeueReusableCell(for: MasterPieceTableViewCell.self, for: indexPath)
            guard let recipe = self.chiefChoiceRecipe else { return cell}
            cell.configureWith(recipe: recipe)
            return cell
            
        case 1 :
            let cell = tableView.dequeueReusableCell(for: RandomSweetySaltySectionTableViewCell.self, for: indexPath)
            cell.delegate = self
            cell.configure(salty: saltyRecipes, sweety: sweetRecipes)
            return cell
            
        case 2 :
            let cell = tableView.dequeueReusableCell(for: CustomSearchTableViewCell.self, for: indexPath)
            cell.delegate = self
            if !customSearchResult.isEmpty {
                cell.results = customSearchResult
                DispatchQueue.main.async {
                    cell.findResultsCollectionView.showLoadingSpinner(show: false)
                    cell.findResultsCollectionView.reloadData()
                    
                }
            }
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return view.bounds.height/2 + 50
        case 1 :
            return view.bounds.height - 150
        case 2 :
            return UITableView.automaticDimension
        default :
            return 0
        }
    }
}

// MARK: - Extension : ViewModel OutPut
extension TheKitchenViewController: TheKitchedViewModelOutPut {
    
    func downloadedWithSuccess() {
        print("Success download")
    }
    
    func downloadError(error: Error) {
        print("failed download")
    }
    
    
    // got custom recipes
    func gotCustomSearchRecipes(recipes: [Recipe]) {
        self.customSearchResult = recipes
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // show error message
    func showErrorMessageFetchingRandom(error: Error) {
        if error.localizedDescription == "The data couldn’t be read because it is missing." {
            viewModel.getChiefChoiceRecipe()
        }
    }
    
    // show error message
    func showErrorMessageFetchingSalty(error: Error) {
        if error.localizedDescription == "The data couldn’t be read because it is missing." {
            viewModel.getSaltyRecipes()
        }
    }
    
    // show error message
    func showErrorMessageFetchingSweet(error: Error) {
        if error.localizedDescription == "The data couldn’t be read because it is missing." {
            viewModel.getSweetRecipes()
        }
    }
    
    // got sweet recuipes
    func gotSweetRecipes(sweetRecipes: [Recipe]) {
        self.sweetRecipes = sweetRecipes
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // got salty recipe
    func gotSaltyRecipes(saltyRecipes: [Recipe]) {
        self.saltyRecipes = saltyRecipes
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // got random recipe
    func gotRandRecipe(recipe: Recipe) {
        self.chiefChoiceRecipe = recipe
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // show random message
    func showErrorMessage(error: Error) {
        print("error")
    }
}

// MARK: - extension : CustomSearchDelegate
extension TheKitchenViewController: CustomSearchTableViewCellDelegate {
    // did tap seach button
    func didTapSearch(customSearch: CustomSearch) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        tableView.setContentOffset(CGPoint(x: 0, y: self.tableView.contentSize.height), animated: true)
        viewModel.getCustomSearchRecipes(customSearch: customSearch)
    }
}

extension TheKitchenViewController: RandomSweetySaltySectionTableViewCellDelegate {
    
    func didDownloadRecipe(recipe: Recipe) {
        viewModel.downloadRecipe(recipe: recipe)
    }
    
    func CollectionViewTableViewCellFinishedDownload() {
        doneDownloadAnimation.show()
    }
    
    func didSelectRecipe(recipe: Recipe) {
        Coordinator().goToDetailedRecipe(from: self, with: recipe)
    }

}
