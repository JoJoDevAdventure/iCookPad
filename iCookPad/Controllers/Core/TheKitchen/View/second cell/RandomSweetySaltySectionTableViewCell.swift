//
//  RandomSweetySaltyTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 20/05/2022.
//

import UIKit

class RandomSweetySaltySectionTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "RandomSweetySaltySectionTableViewCell"
    
    private let titleSection: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 52)
        label.text = "We propose, You chose."
        return label
    }()
    
    private let sweetyTitleSection: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 38)
        label.text = "Sweety"
        return label
    }()
    
    private let sweetyRecipesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .gray
        tableView.register(SaltySweetyTableViewCell.self, forCellReuseIdentifier: SaltySweetyTableViewCell.identifier)
        tableView.separatorColor = .clear
        tableView.sectionIndexColor = .clear
        tableView.backgroundColor = UIColor.BackgroundColors.background
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private let saltyTitleSection: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 38)
        label.text = "Salty"
        return label
    }()
    
    private let saltyRecipesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .gray
        tableView.register(SaltySweetyTableViewCell.self, forCellReuseIdentifier: SaltySweetyTableViewCell.identifier)
        tableView.separatorColor = .clear
        tableView.sectionIndexColor = .clear
        tableView.backgroundColor = UIColor.BackgroundColors.background
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private let topSaltySeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.LabelColors.mainTitleColor
        return view
    }()
    
    private let topSweetySeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.LabelColors.mainTitleColor
        return view
    }()
    
    private let bottomSaltySeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.LabelColors.mainTitleColor
        return view
    }()
    
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
    
    private func setupTableView() {
        sweetyRecipesTableView.delegate = self
        saltyRecipesTableView.delegate = self
        sweetyRecipesTableView.dataSource = self
        saltyRecipesTableView.dataSource = self
    }
    
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
    
    private func setupConstraints() {
        let constraints = [
            
            titleSection.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            titleSection.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            saltyTitleSection.centerXAnchor.constraint(equalTo: saltyRecipesTableView.centerXAnchor),
            saltyTitleSection.topAnchor.constraint(equalTo: titleSection.bottomAnchor, constant: 40),
            
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
            saltyRecipesTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.69),
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
            sweetyRecipesTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.69),
            sweetyRecipesTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            //bottom separator
            bottomSweetySeparator.centerXAnchor.constraint(equalTo: sweetyRecipesTableView.centerXAnchor),
            bottomSweetySeparator.widthAnchor.constraint(equalTo: sweetyRecipesTableView.widthAnchor),
            bottomSweetySeparator.topAnchor.constraint(equalTo: sweetyRecipesTableView.bottomAnchor, constant: -5),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    

}
// MARK: - Functions
extension RandomSweetySaltySectionTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SaltySweetyTableViewCell.identifier) as? SaltySweetyTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (saltyRecipesTableView.bounds.height / 2) - 10
    }
    
}
