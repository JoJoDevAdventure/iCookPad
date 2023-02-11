//
//  ToDoTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 10/06/2022.
//

import UIKit
protocol ToDoTableViewCellDelegate {
    func didPressDeleteRecipe(recipe: RecipeItem)
    func didPressArchieveRecipe(recipe: RecipeItem)
}

class ToDoTableViewCell: UITableViewCell {
    
    public var delegate: ToDoTableViewCellDelegate?
    
    private var recipe: RecipeItem? = nil
    
    // MARK: - Properties
    private lazy var container: ItemsContainerView = {
        let container = ItemsContainerView()
        container.configure()
        container.layer.cornerRadius = 30
        container.isUserInteractionEnabled = true
        return container
    }()
    
    private lazy var previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        image.layer.cornerRadius = 23
        image.backgroundColor = .lightGray
        return image
    }()
    
    private lazy var cancelRecipe: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "x.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 45)), for: .normal)
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFit
        button.tintColor = UIColor.Buttons.redButton
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var validateRecipe: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 45)), for: .normal)
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFit
        button.isUserInteractionEnabled = true
        button.tintColor = UIColor.Buttons.greenButton
        return button
    }()
    
    private lazy var titleRecipe: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 28)
        label.text = "Test Title"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var timeProprety: PropretyContainerView = {
        let prop = PropretyContainerView()
        return prop
    }()
    
    private lazy var coastProprety: PropretyContainerView = {
        let prop = PropretyContainerView()
        return prop
    }()
    
    private lazy var caloriesProprety: PropretyContainerView = {
        let prop = PropretyContainerView()
        return prop
    }()
    
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupSubviews()
        setupConstraints()
        selectionStyle = .none
        contentView.isUserInteractionEnabled = false
        setupButtonAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set up
    private func setupSubviews() {
        addSubview(container)
        container.addSubview(previewImage)
        container.addSubview(cancelRecipe)
        container.addSubview(validateRecipe)
        container.addSubview(titleRecipe)
        container.addSubview(timeProprety)
        container.addSubview(coastProprety)
        container.addSubview(caloriesProprety)
    }
    
    private func setupConstraints() {
        let constraints = [
            container.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            container.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            container.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            previewImage.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10),
            previewImage.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            previewImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            previewImage.widthAnchor.constraint(equalTo: previewImage.heightAnchor, multiplier: 1.2),
            
            cancelRecipe.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.3),
            cancelRecipe.heightAnchor.constraint(equalTo: cancelRecipe.widthAnchor),
            cancelRecipe.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -15),
            cancelRecipe.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 35),
            
            validateRecipe.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.3),
            validateRecipe.heightAnchor.constraint(equalTo: validateRecipe.widthAnchor),
            validateRecipe.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -15),
            validateRecipe.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -35),
            
            titleRecipe.leftAnchor.constraint(equalTo: previewImage.rightAnchor, constant: 10),
            titleRecipe.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            titleRecipe.rightAnchor.constraint(equalTo: validateRecipe.leftAnchor, constant: -10),
            
            timeProprety.centerXAnchor.constraint(equalTo: titleRecipe.centerXAnchor),
            timeProprety.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
            timeProprety.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.4),
            timeProprety.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.22),
            
            coastProprety.heightAnchor.constraint(equalTo: timeProprety.heightAnchor),
            coastProprety.leftAnchor.constraint(equalTo: previewImage.rightAnchor, constant: 15),
            coastProprety.centerYAnchor.constraint(equalTo: timeProprety.centerYAnchor),
            coastProprety.rightAnchor.constraint(equalTo: timeProprety.leftAnchor, constant: -15),
            
            caloriesProprety.heightAnchor.constraint(equalTo: timeProprety.heightAnchor),
            caloriesProprety.leftAnchor.constraint(equalTo: timeProprety.rightAnchor, constant: 15),
            caloriesProprety.centerYAnchor.constraint(equalTo: timeProprety.centerYAnchor),
            caloriesProprety.rightAnchor.constraint(equalTo: cancelRecipe.leftAnchor, constant: -15),
        ]
        NSLayoutConstraint.activate(constraints)    }
    
    private func setupButtonAction() {
        cancelRecipe.addTarget(self, action: #selector(deleteRecipe(_:)), for: .touchUpInside)
        validateRecipe.addTarget(self, action: #selector(archiveRecipe(_:)), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    @objc private func deleteRecipe(_ sender: UIButton) {
        guard let recipe = self.recipe else {
            return
        }
        delegate?.didPressDeleteRecipe(recipe: recipe)
    }
    
    @objc private func archiveRecipe(_ sender: UIButton) {
        guard let recipe = self.recipe else {
            return
        }
        delegate?.didPressArchieveRecipe(recipe: recipe)
    }
    
    public func configure(recipe: RecipeItem) {
        self.recipe = recipe
        if let localImageURLString = recipe.localImageUrl,
                let localImageURL = URL(string: localImageURLString),
                let imageData = try? Data(contentsOf: localImageURL),
                let image = UIImage(data: imageData) {
            
                self.previewImage.image = image
            } else {
                print("Error fetching image")
            }
        
        titleRecipe.text = recipe.title
        timeProprety.configure(proprety: "Prep Time :" , Value: "\(recipe.readyInMinutes - 5) - \(recipe.readyInMinutes + 5)")
        coastProprety.configure(proprety: "Coast :", Value: "\(recipe.pricePerServing) $")
        caloriesProprety.configure(proprety: "Calories :", Value: "\(recipe.weightWatcherSmartPoints*35) KCal")
    }
    
}
