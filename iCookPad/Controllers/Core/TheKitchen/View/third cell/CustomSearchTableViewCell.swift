//
//  CustomSearchTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 24/05/2022.
//

import UIKit

class CustomSearchTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let cuisines = ["African", "American", "Chinese", "French","Indian","Italian", "Japanese", "Thai"]
    
    private let types = ["breakfast","lunch","soup","salad","dessert", "snack","beverage", "drink"]
    
    private let diet = ["Ketogenic","Pescetarian","Paleo","Primal","Low FODMAP","Whole30"]
    
    static let identifier = "CustomSearchTableViewCe"
    
    // MARK: - UI
    
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
    
    private let glutenFreeLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 22)
        label.text = "Gluten free :"
        return label
    }()
    
    private let glutenSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemGreen
        return switcher
    }()
    
    private let veganFreeLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 22)
        label.text = "Vegan :"
        return label
    }()
    
    private let veganSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemGreen
        return switcher
    }()
    
    private let vegetarianFreeLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 22)
        label.text = "Vegetarian :"
        return label
    }()
    
    private let vegetarianSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemGreen
        return switcher
    }()
    
    private let findButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Find !", for: .normal)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.3
        return button
    }()
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.BackgroundColors.background
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        setupSubviews()
        setupConstraints()
        setupSelection()
        setupButtonsAction()
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
        addSubview(glutenFreeLabel)
        addSubview(glutenSwitch)
        addSubview(vegetarianFreeLabel)
        addSubview(vegetarianSwitch)
        addSubview(veganSwitch)
        addSubview(veganFreeLabel)
        addSubview(findButton)
    }
    
    private func setupConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
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
            
            glutenFreeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 35),
            glutenFreeLabel.topAnchor.constraint(equalTo: selectionOfDiet.bottomAnchor, constant: 50),
            
            glutenSwitch.leftAnchor.constraint(equalTo: glutenFreeLabel.rightAnchor, constant: 10),
            glutenSwitch.centerYAnchor.constraint(equalTo: glutenFreeLabel.centerYAnchor),
            
            vegetarianFreeLabel.leftAnchor.constraint(equalTo: glutenSwitch.rightAnchor, constant: 40),
            vegetarianFreeLabel.topAnchor.constraint(equalTo: glutenFreeLabel.topAnchor),
            
            vegetarianSwitch.leftAnchor.constraint(equalTo: vegetarianFreeLabel.rightAnchor, constant: 10),
            vegetarianSwitch.centerYAnchor.constraint(equalTo: vegetarianFreeLabel.centerYAnchor),
            
            veganFreeLabel.leftAnchor.constraint(equalTo: vegetarianSwitch.rightAnchor, constant: 40),
            veganFreeLabel.topAnchor.constraint(equalTo: glutenFreeLabel.topAnchor),
            
            veganSwitch.leftAnchor.constraint(equalTo: veganFreeLabel.rightAnchor, constant: 10),
            veganSwitch.centerYAnchor.constraint(equalTo: veganFreeLabel.centerYAnchor),
            
            findButton.leftAnchor.constraint(equalTo: veganSwitch.rightAnchor, constant: 40),
            findButton.heightAnchor.constraint(equalToConstant: 50),
            findButton.centerYAnchor.constraint(equalTo: veganSwitch.centerYAnchor),
            findButton.widthAnchor.constraint(equalToConstant: 150),
            findButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupSelection() {
        selectionOfOrigin.setup(title: "N/A", selectionItems: cuisines)
        selectionOfType.setup(title: "N/A", selectionItems: types)
        selectionOfDiet.setup(title: "N/A", selectionItems: diet)
    }
    
    private func setupButtonsAction() {
        findButton.addAction(UIAction(handler: { _ in
            self.collectInformations()
        }), for: .touchUpInside)
    }
    // MARK: - Functions
    
    func collectInformations() {
        let origin = selectionOfOrigin.getSelectedItem() ?? "N/A"
        let type = selectionOfType.getSelectedItem() ?? "N/A"
        let diet = selectionOfDiet.getSelectedItem() ?? "N/A"
        let glutenFree = glutenSwitch.isOn
        let vegetarian = vegetarianSwitch.isOn
        let vegan = veganSwitch.isOn
        
        print("origin: \(origin), type: \(type), diet: \(diet), gluten free ?: \(glutenFree), vegetarian ?: \(vegetarian), vegan ?: \(vegan)")
    }
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    
}
