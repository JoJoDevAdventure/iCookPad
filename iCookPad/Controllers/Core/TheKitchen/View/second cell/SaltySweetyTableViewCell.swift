//
//  SaltySweetTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 20/05/2022.
//

import UIKit
import SDWebImage

class SaltySweetyTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "SaltySweetyTableViewCell"
    
    private let container: ItemsContainerView = {
        let view = ItemsContainerView()
        view.configure()
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let recipeTitle: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 24)
        label.text = "This is recipe title a delicious recipe"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let informationContainer: ItemsContainerView = {
        let view = ItemsContainerView()
        view.configure()
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let caloriesIcon: iconImageView = {
        let icon = iconImageView()
        icon.configure(iconName: "caloriesIcon", size: 30)
        return icon
    }()
    
    private let caloriesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor.LabelColors.secondLabelColor
        return label
    }()
    
    private let timeIcon: iconImageView = {
        let icon = iconImageView()
        icon.configure(iconName: "TimeIcon", size: 30)
        return icon
    }()
    
    private let coastIcon: iconImageView = {
        let icon = iconImageView()
        icon.configure(iconName: "CoastIcon", size: 30)
        return icon
    }()
    
    private let previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.backgroundColor = .gray
        image.configure()
        image.layer.cornerRadius = 15
        return image
    }()
    
    private let difficultyProperty: DifficultyContainerView = {
        let view = DifficultyContainerView()
        view.configure()
        view.setupDifficulty(difficulty: 0)
        return view
    }()

    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.BackgroundColors.background
        selectionStyle = .none
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set up
    
    private func setupSubViews() {
        addSubview(container)
        container.addSubview(previewImage)
        container.addSubview(recipeTitle)
        container.addSubview(informationContainer)
        informationContainer.addSubview(caloriesIcon)
        informationContainer.addSubview(timeIcon)
        informationContainer.addSubview(coastIcon)
        container.addSubview(difficultyProperty)
    }
    
    private func setupConstraints() {
        let constraints = [
            //container
            container.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            container.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            container.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            // title
            recipeTitle.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -20),
            recipeTitle.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            recipeTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            
            //image preview
            previewImage.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.45),
            previewImage.heightAnchor.constraint(equalTo: previewImage.widthAnchor, multiplier: 0.9),
            previewImage.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10),
            previewImage.topAnchor.constraint(equalTo: recipeTitle.bottomAnchor, constant: 15),
            
            //container for informations
            informationContainer.widthAnchor.constraint(equalTo: previewImage.widthAnchor),
            informationContainer.heightAnchor.constraint(equalTo: previewImage.heightAnchor),
            informationContainer.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            informationContainer.topAnchor.constraint(equalTo: previewImage.topAnchor),
            
            //difficulty property
            difficultyProperty.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -30),
            difficultyProperty.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            difficultyProperty.topAnchor.constraint(equalTo: informationContainer.bottomAnchor, constant: 10),
            difficultyProperty.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.22),
            
            /// Icons :
            
            caloriesIcon.topAnchor.constraint(equalTo: informationContainer.topAnchor,constant: 20),
            caloriesIcon.leftAnchor.constraint(equalTo: informationContainer.leftAnchor, constant: 15),
            
            timeIcon.centerYAnchor.constraint(equalTo: informationContainer.centerYAnchor),
            timeIcon.leftAnchor.constraint(equalTo: caloriesIcon.leftAnchor),
            
            coastIcon.bottomAnchor.constraint(equalTo: informationContainer.bottomAnchor,constant: -20),
            coastIcon.leftAnchor.constraint(equalTo: caloriesIcon.leftAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions

    func configure(recipe: Recipe) {
        recipeTitle.text = recipe.title
        guard let url = recipe.image else { return }
        previewImage.sd_setImage(with: URL(string: url))
        let difficulty = DifficultyProperty().calculateDifficulty(recipe: recipe)
        difficultyProperty.setupDifficulty(difficulty: difficulty)
    }
}
