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
        return tableView
    }()
    
    // MARK: - View Model
    
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor.BackgroundColors.background
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set up
    
    private func setupSubviews() {
        addSubview(titleSection)
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
            
            saltyRecipesTableView.topAnchor.constraint(equalTo: saltyTitleSection.bottomAnchor, constant: 30),
            saltyRecipesTableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -60),
            saltyRecipesTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.69),
            saltyRecipesTableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            
            sweetyRecipesTableView.topAnchor.constraint(equalTo: saltyRecipesTableView.topAnchor),
            sweetyRecipesTableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -60),
            sweetyRecipesTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.69),
            sweetyRecipesTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    
}
