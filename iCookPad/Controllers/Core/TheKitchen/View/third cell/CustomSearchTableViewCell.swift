//
//  CustomSearchTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 24/05/2022.
//

import UIKit

class CustomSearchTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CustomSearchTableViewCe"
    
    private let titleLabel: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 38)
        label.text = "You wish, We grant. "
        return label
    }()
    
    private let originLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 28)
        label.text = "Origin preference : "
        return label
    }()
    
    private let selectionOfOrigin: DropDownMenu = {
        let view = DropDownMenu()
        view.configure()
        view.setup(title: "test", selectionItems: ["test1", "test2", "test3", "test4"])
        return view
    }()
    
    private let typeLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 28)
        label.text = "Type preference : "
        return label
    }()
    
    private let selectionOfType: DropDownMenu = {
        let view = DropDownMenu()
        view.configure()
        view.setup(title: "test", selectionItems: ["test1", "test2", "test3", "test4"])
        return view
    }()
    
    private let dietLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 28)
        label.text = "Diet preference : "
        return label
    }()
    
    private let selectionOfDiet: DropDownMenu = {
        let view = DropDownMenu()
        view.configure()
        view.setup(title: "test", selectionItems: ["test1", "test2", "test3", "test4"])
        return view
    }()
    
    // MARK: - View Model
    
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.BackgroundColors.background
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up
    
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(originLabel)
        addSubview(selectionOfOrigin)
        addSubview(typeLabel)
        addSubview(selectionOfType)
        addSubview(dietLabel)
        addSubview(selectionOfDiet)
    }
    
    private func setupConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -400),
            
            originLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            originLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            
            selectionOfOrigin.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 10),
            selectionOfOrigin.leftAnchor.constraint(equalTo: originLabel.leftAnchor),
            
            typeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            typeLabel.topAnchor.constraint(equalTo: originLabel.topAnchor),
            
            selectionOfType.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            selectionOfType.leftAnchor.constraint(equalTo: typeLabel.leftAnchor),
            
            dietLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -45),
            dietLabel.topAnchor.constraint(equalTo: originLabel.topAnchor),

            selectionOfDiet.topAnchor.constraint(equalTo: dietLabel.bottomAnchor, constant: 10),
            selectionOfDiet.leftAnchor.constraint(equalTo: dietLabel.leftAnchor),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    
}
