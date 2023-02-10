//
//  RandomSweetySaltyTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 20/05/2022.
//

import UIKit

protocol RandomSweetySaltySectionTableViewCellDelegate : AnyObject {
    func didSelectRecipe(recipe: Recipe)
    func didDownloadRecipe(recipe: Recipe)
    func CollectionViewTableViewCellFinishedDownload()
}


class RandomSweetySaltySectionTableViewCell: UITableViewCell {
    
    weak var delegate : RandomSweetySaltySectionTableViewCellDelegate?
    
    // MARK: - Properties
    
    var sweetRecipes: [Recipe] = []
    var saltyRecipes: [Recipe] = []
    
    // Title
    private let titleSection: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 52)
        label.text = "We propose, You chose."
        return label
    }()
    
    //Sweety Title
    private let sweetyTitleSection: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 38)
        label.text = "Sweety"
        return label
    }()
    
    // Sweety TableView
    private let sweetyRecipesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .gray
        tableView.registerCell(SaltySweetyTableViewCell.self)
        tableView.separatorColor = .clear
        tableView.sectionIndexColor = .clear
        tableView.backgroundColor = UIColor.BackgroundColors.background
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // Salty Title
    private let saltyTitleSection: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 38)
        label.text = "Salty"
        return label
    }()
    
    // Salty TableView
    private let saltyRecipesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .gray
        tableView.registerCell(SaltySweetyTableViewCell.self)
        tableView.separatorColor = .clear
        tableView.sectionIndexColor = .clear
        tableView.backgroundColor = UIColor.BackgroundColors.background
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    /// Separators :
    // Salty Top
    private let topSaltySeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.LabelColors.mainTitleColor
        return view
    }()
    // Sweety Top
    private let topSweetySeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.LabelColors.mainTitleColor
        return view
    }()
    // Salty Bottom
    private let bottomSaltySeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.LabelColors.mainTitleColor
        return view
    }()
    // Sweety Bottom
    private let bottomSweetySeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.LabelColors.mainTitleColor
        return view
    }()
    
    // MARK: - View Model
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        backgroundColor = UIColor.BackgroundColors.background
        setupSubviews()
        setupConstraints()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set up
    // setup TableView
    private func setupTableView() {
        sweetyRecipesTableView.delegate = self
        saltyRecipesTableView.delegate = self
        sweetyRecipesTableView.dataSource = self
        saltyRecipesTableView.dataSource = self
    }
    // Adding SubViews
    private func setupSubviews() {
        addSubview(titleSection)
        addSubview(topSaltySeparator)
        addSubview(topSweetySeparator)
        addSubview(bottomSaltySeparator)
        addSubview(bottomSweetySeparator)
        addSubview(saltyTitleSection)
        addSubview(saltyRecipesTableView)
        addSubview(sweetyTitleSection)
        addSubview(sweetyRecipesTableView)
    }
    // Constraints
    private func setupConstraints() {
        let constraints = [
            // Title
            titleSection.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            titleSection.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            // Salty Title
            saltyTitleSection.centerXAnchor.constraint(equalTo: saltyRecipesTableView.centerXAnchor),
            saltyTitleSection.topAnchor.constraint(equalTo: titleSection.bottomAnchor, constant: 40),
            // Sweety Title
            sweetyTitleSection.centerXAnchor.constraint(equalTo: sweetyRecipesTableView.centerXAnchor),
            sweetyTitleSection.topAnchor.constraint(equalTo: saltyTitleSection.topAnchor),
            
            /// Salty
            //top separator
            topSaltySeparator.centerXAnchor.constraint(equalTo: saltyRecipesTableView.centerXAnchor),
            topSaltySeparator.widthAnchor.constraint(equalTo: saltyRecipesTableView.widthAnchor),
            topSaltySeparator.bottomAnchor.constraint(equalTo: saltyRecipesTableView.topAnchor, constant: 5),
            //tableview
            saltyRecipesTableView.topAnchor.constraint(equalTo: saltyTitleSection.bottomAnchor, constant: 30),
            saltyRecipesTableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -50),
            saltyRecipesTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            saltyRecipesTableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            //bottom separator
            bottomSaltySeparator.centerXAnchor.constraint(equalTo: saltyRecipesTableView.centerXAnchor),
            bottomSaltySeparator.widthAnchor.constraint(equalTo: saltyRecipesTableView.widthAnchor),
            bottomSaltySeparator.topAnchor.constraint(equalTo: saltyRecipesTableView.bottomAnchor, constant: -5),
            
            /// Sweet
            //top separator
            topSweetySeparator.centerXAnchor.constraint(equalTo: sweetyRecipesTableView.centerXAnchor),
            topSweetySeparator.widthAnchor.constraint(equalTo: sweetyRecipesTableView.widthAnchor),
            topSweetySeparator.bottomAnchor.constraint(equalTo: sweetyRecipesTableView.topAnchor, constant: 5),
            //tableview
            sweetyRecipesTableView.topAnchor.constraint(equalTo: saltyRecipesTableView.topAnchor),
            sweetyRecipesTableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -50),
            sweetyRecipesTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            sweetyRecipesTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            //bottom separator
            bottomSweetySeparator.centerXAnchor.constraint(equalTo: sweetyRecipesTableView.centerXAnchor),
            bottomSweetySeparator.widthAnchor.constraint(equalTo: sweetyRecipesTableView.widthAnchor),
            bottomSweetySeparator.topAnchor.constraint(equalTo: sweetyRecipesTableView.bottomAnchor, constant: -5),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    private func saveSweetRecipeAt(_ indexPath : IndexPath) {
        let recipe = sweetRecipes[indexPath.row]
        delegate?.didDownloadRecipe(recipe: recipe)
    }
    
    private func saveSaltyRecipeAt(_ indexPath : IndexPath) {
        let recipe = saltyRecipes[indexPath.row]
        delegate?.didDownloadRecipe(recipe: recipe)
    }

}
// MARK: - Extension : TableView
extension RandomSweetySaltySectionTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == sweetyRecipesTableView {
            if sweetRecipes.isEmpty {
                sweetyRecipesTableView.isHidden = true
            } else {
                sweetyRecipesTableView.isHidden = false
            }
            return sweetRecipes.count
        } else if tableView == saltyRecipesTableView {
            if saltyRecipes.isEmpty {
                saltyRecipesTableView.isHidden = true
            } else {
                saltyRecipesTableView.isHidden = false
            }
            return saltyRecipes.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: SaltySweetyTableViewCell.self, for: indexPath)
        if tableView == sweetyRecipesTableView {
            let recipe = sweetRecipes[indexPath.row]
            cell.configure(recipe: recipe)
        } else if tableView == saltyRecipesTableView {
            let recipe = saltyRecipes[indexPath.row]
            cell.configure(recipe: recipe)
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func configure(salty: [Recipe], sweety: [Recipe]) {
        self.saltyRecipes = salty
        self.sweetRecipes = sweety
        DispatchQueue.main.async {
            self.sweetyRecipesTableView.reloadData()
            self.saltyRecipesTableView.reloadData()
        }
    }
    
    //Press cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sweetyRecipesTableView {
            let recipe = sweetRecipes[indexPath.row]
            delegate?.didSelectRecipe(recipe: recipe)
        } else if tableView == saltyRecipesTableView {
            let recipe = saltyRecipes[indexPath.row]
            delegate?.didSelectRecipe(recipe: recipe)
        }
    }
    
    //Hold pressing cell :
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        if tableView == sweetyRecipesTableView {
            let config = UIContextMenuConfiguration(
                identifier: nil,
                previewProvider: nil) {[weak self] _ in
                    let save = UIAction(title: "download", image: UIImage(systemName: "arrow.down.to.line"), identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                        self?.saveSweetRecipeAt(indexPath)
                    }
                    
                    return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [save])
            }
            return config
        } else {
            let config = UIContextMenuConfiguration(
                identifier: nil,
                previewProvider: nil) {[weak self] _ in
                    let save = UIAction(title: "download", image: UIImage(systemName: "arrow.down.to.line"), identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                        self?.saveSaltyRecipeAt(indexPath)
                    }
                    return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [save])
            }
            return config
        }

    }
        
        
}
