//
//  CustomSearchTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 24/05/2022.
//

import UIKit

protocol CustomSearchTableViewCellDelegate : AnyObject {
    func didTapSearch(customSearch: CustomSearch)
}


class CustomSearchTableViewCell: UITableViewCell {
    
    var results : [Recipe] = []
    
    // MARK: - Properties
    
    weak var delegate: CustomSearchTableViewCellDelegate?
    
    static let identifier = "CustomSearchTableViewCe"
    
    // MARK: - UI
    // Title
    private let titleLabel: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 38)
        label.text = "You wish, We grant. "
        return label
    }()
    // Origin Label
    private let originLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 28)
        label.text = "Origin preference : "
        return label
    }()
    // Origin DropDownMenu
    private let selectionOfOrigin: DropDownMenu = {
        let view = DropDownMenu()
        view.configure()
        return view
    }()
    // Type Label
    private let typeLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 28)
        label.text = "Type preference : "
        return label
    }()
    // Type DropDownMenu
    private let selectionOfType: DropDownMenu = {
        let view = DropDownMenu()
        view.configure()
        view.setup(title: "test", selectionItems: ["test1", "test2", "test3", "test4"])
        return view
    }()
    // Diet Label
    private let dietLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 28)
        label.text = "Diet preference : "
        return label
    }()
    // Diet DropDownMenu
    private let selectionOfDiet: DropDownMenu = {
        let view = DropDownMenu()
        view.configure()
        view.setup(title: "test", selectionItems: ["test1", "test2", "test3", "test4"])
        return view
    }()
    // Gluten free Label
    private let glutenFreeLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 22)
        label.text = "Gluten free :"
        return label
    }()
    // Gluten switch
    private let glutenSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemGreen
        return switcher
    }()
    // Vegan Free Label
    private let veganFreeLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 22)
        label.text = "Vegan :"
        return label
    }()
    // Vegan Switch
    private let veganSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemGreen
        return switcher
    }()
    // Vegetarien Free Label
    private let vegetarianFreeLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.configure(fontSize: 22)
        label.text = "Vegetarian :"
        return label
    }()
    // Vegetarian switch
    private let vegetarianSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemGreen
        return switcher
    }()
    // Find Rexipe Button
    private let findButton = FindButton(frame: .zero)
    
    //Collection View
    let findResultsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 400, height: 400)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.registerCell(SearchCollectionViewCell.self)
        collection.isHidden = true
        collection.backgroundColor = UIColor.BackgroundColors.background
        return collection
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
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up
    // Adding Subviews
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
        addSubview(findResultsCollectionView)
    }
    // Constraints
    private func setupConstraints() {
        let constraints = [
            // Title
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            // Origin Label
            originLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            originLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            // Origin Selection
            selectionOfOrigin.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 10),
            selectionOfOrigin.leftAnchor.constraint(equalTo: originLabel.leftAnchor),
            // Type Label
            typeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            typeLabel.topAnchor.constraint(equalTo: originLabel.topAnchor),
            // Type Selection
            selectionOfType.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            selectionOfType.leftAnchor.constraint(equalTo: typeLabel.leftAnchor),
            // Diet Label
            dietLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -45),
            dietLabel.topAnchor.constraint(equalTo: originLabel.topAnchor),
            // Diet Selection
            selectionOfDiet.topAnchor.constraint(equalTo: dietLabel.bottomAnchor, constant: 10),
            selectionOfDiet.leftAnchor.constraint(equalTo: dietLabel.leftAnchor),
            // GlutenFree Label
            glutenFreeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 35),
            glutenFreeLabel.topAnchor.constraint(equalTo: selectionOfDiet.bottomAnchor, constant: 50),
            // Gluten Switch
            glutenSwitch.leftAnchor.constraint(equalTo: glutenFreeLabel.rightAnchor, constant: 10),
            glutenSwitch.centerYAnchor.constraint(equalTo: glutenFreeLabel.centerYAnchor),
            // Vegetarian Label
            vegetarianFreeLabel.leftAnchor.constraint(equalTo: glutenSwitch.rightAnchor, constant: 40),
            vegetarianFreeLabel.topAnchor.constraint(equalTo: glutenFreeLabel.topAnchor),
            // Vegetarian Switch
            vegetarianSwitch.leftAnchor.constraint(equalTo: vegetarianFreeLabel.rightAnchor, constant: 10),
            vegetarianSwitch.centerYAnchor.constraint(equalTo: vegetarianFreeLabel.centerYAnchor),
            // Vegan Label
            veganFreeLabel.leftAnchor.constraint(equalTo: vegetarianSwitch.rightAnchor, constant: 40),
            veganFreeLabel.topAnchor.constraint(equalTo: glutenFreeLabel.topAnchor),
            // Vegan Switch
            veganSwitch.leftAnchor.constraint(equalTo: veganFreeLabel.rightAnchor, constant: 10),
            veganSwitch.centerYAnchor.constraint(equalTo: veganFreeLabel.centerYAnchor),
            // Find Button
            findButton.leftAnchor.constraint(greaterThanOrEqualTo: veganSwitch.rightAnchor, constant: 40),
            findButton.heightAnchor.constraint(equalToConstant: 50),
            findButton.centerYAnchor.constraint(equalTo: veganSwitch.centerYAnchor),
            findButton.widthAnchor.constraint(equalToConstant: 50),
            findButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            
        ]
        if findResultsCollectionView.isHidden {
            findButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
        } else {
            findButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = false
            findResultsCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            findResultsCollectionView.heightAnchor.constraint(equalToConstant: 430).isActive = true
            findResultsCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            findResultsCollectionView.topAnchor.constraint(equalTo: findButton.bottomAnchor, constant: 20).isActive = true
            findButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -500).isActive = true
        }
        NSLayoutConstraint.activate(constraints)
    }
    // setupSelection titles
    private func setupSelection() {
        var origins : [String] = []
        Origin.allCases.forEach({origins.append($0.description)})
        var types : [String] = []
        TypeOfMeal.allCases.forEach({types.append($0.description)})
        var diets : [String] = []
        Diet.allCases.forEach({diets.append($0.description)})
        
        selectionOfOrigin.setup(title: Origin.na.description, selectionItems: origins)
        selectionOfType.setup(title: TypeOfMeal.na.description, selectionItems: types)
        selectionOfDiet.setup(title: Diet.na.description, selectionItems: diets)
        
        
    }
    // Setup Find Button action
    private func setupButtonsAction() {
        findButton.addAction(UIAction(handler: { _ in
            self.collectInformations()
            self.setupConstraints()
        }), for: .touchUpInside)
    }
    //setup CollectionView
    private func setupCollectionView() {
        findResultsCollectionView.delegate = self
        findResultsCollectionView.dataSource = self
    }
    
    // MARK: - Functions
    // Get all data
    // TODO: - API Requeset
    func collectInformations() {
        let origin = selectionOfOrigin.getSelectedItem() ?? "N/A"
        let type = selectionOfType.getSelectedItem() ?? "N/A"
        let diet = selectionOfDiet.getSelectedItem() ?? "N/A"
        let glutenFree = glutenSwitch.isOn
        let vegetarian = vegetarianSwitch.isOn
        let vegan = veganSwitch.isOn
        let customOrigin = CustomSearch(origin: origin, type: type, diet: diet, glutenFree: glutenFree, vegetarian: vegetarian, vegan: vegan)
        print(customOrigin)
        self.delegate?.didTapSearch(customSearch: customOrigin)
        findResultsCollectionView.isHidden = false
        findResultsCollectionView.showLoadingSpinner(show: true)
    }
    
    
    // MARK: - Network Manager calls
    
}
// MARK: - Extension : CollectionView
extension CustomSearchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: SearchCollectionViewCell.self, for: indexPath)
        if !results.isEmpty {
            cell.configure(recipe: results[indexPath.row])
        }
        return cell
    }
}
