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
        tableView.backgroundColor = UIColor.BackgroundColors.background
        tableView.sectionIndexColor = .clear
        tableView.separatorColor = .clear
        tableView.register(MasterPieceTableViewCell.self, forCellReuseIdentifier: MasterPieceTableViewCell.identifier)
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
        setupTableView()
    }
    
    // MARK: - Set up
    
    private func setupNavBar() {
        title = "iCookBook"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor.BackgroundColors.background
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.LabelColors.mainTitleColor, .font: UIFont.systemFont(ofSize: 60, weight: UIFont.Weight.bold) ]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.LabelColors.mainTitleColor, .font: UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)]
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls


}
// MARK: - Extensions
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MasterPieceTableViewCell.identifier) as? MasterPieceTableViewCell else { return UITableViewCell() }
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return view.bounds.height/2
        default :
            return 0
        }
    }
    
}
