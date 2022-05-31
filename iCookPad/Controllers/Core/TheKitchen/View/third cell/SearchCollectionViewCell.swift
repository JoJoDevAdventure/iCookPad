//
//  SearchCollectionViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 31/05/2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    
    // container
    private let container: ItemsContainerView = {
        let view = ItemsContainerView()
        view.configure()
        view.layer.cornerRadius = 20
        return view
    }()
    
    // recipe Title
    private let recipeTitle: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 24)
        label.text = "This is recipe title a delicious recipe"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    // information
    private let informationContainer: ItemsContainerView = {
        let view = ItemsContainerView()
        view.configure()
        view.layer.cornerRadius = 15
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        return view
    }()
    
    // calories Icon
    private let caloriesIcon: iconImageView = {
        let icon = iconImageView()
        icon.configure(iconName: "caloriesIcon", size: 30)
        return icon
    }()
    
    // Calories Value
    private let caloriesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor.LabelColors.secondLabelColor
        return label
    }()
    
    // Time icon
    private let timeIcon: iconImageView = {
        let icon = iconImageView()
        icon.configure(iconName: "TimeIcon", size: 30)
        return icon
    }()
    
    // Time Value
    private let timeValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor.LabelColors.secondLabelColor
        return label
    }()
    
    // Coast Icon
    private let coastIcon: iconImageView = {
        let icon = iconImageView()
        icon.configure(iconName: "CoastIcon", size: 30)
        return icon
    }()
    
    // Coast Value
    private let coastValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor.LabelColors.secondLabelColor
        return label
    }()
    
    // Preview Image
    private let previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.backgroundColor = .gray
        image.configure()
        image.layer.cornerRadius = 15
        return image
    }()
    
    // Difficulty property
    private let difficultyProperty: DifficultyContainerView = {
        let view = DifficultyContainerView()
        view.configure()
        view.setupDifficulty(difficulty: 0)
        return view
    }()

    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.BackgroundColors.background
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set up
    // adding subviews
    private func setupSubViews() {
        addSubview(container)
        container.addSubview(previewImage)
        container.addSubview(recipeTitle)
        container.addSubview(informationContainer)
        informationContainer.addSubview(caloriesIcon)
        informationContainer.addSubview(caloriesValueLabel)
        informationContainer.addSubview(timeIcon)
        informationContainer.addSubview(timeValueLabel)
        informationContainer.addSubview(coastIcon)
        informationContainer.addSubview(coastValueLabel)
        container.addSubview(difficultyProperty)
    }
    
    //Constraints
    private func setupConstraints() {
        let constraints = [
            //container
            container.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            container.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            container.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            container.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
            
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
            difficultyProperty.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -20),
            difficultyProperty.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            difficultyProperty.topAnchor.constraint(equalTo: previewImage.bottomAnchor, constant: 20),
            difficultyProperty.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.22),
            difficultyProperty.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            
            /// Icons :
            // calories icon
            caloriesIcon.topAnchor.constraint(equalTo: informationContainer.topAnchor,constant: 15),
            caloriesIcon.leftAnchor.constraint(equalTo: informationContainer.leftAnchor, constant: 15),
            // time icon
            timeIcon.centerYAnchor.constraint(equalTo: informationContainer.centerYAnchor),
            timeIcon.leftAnchor.constraint(equalTo: caloriesIcon.leftAnchor),
            // coast icon
            coastIcon.bottomAnchor.constraint(equalTo: informationContainer.bottomAnchor,constant: -15),
            coastIcon.leftAnchor.constraint(equalTo: caloriesIcon.leftAnchor),
            // calories value
            caloriesValueLabel.centerYAnchor.constraint(equalTo: caloriesIcon.centerYAnchor),
            caloriesValueLabel.leftAnchor.constraint(equalTo: caloriesIcon.rightAnchor, constant: 5),
            // time value
            timeValueLabel.centerYAnchor.constraint(equalTo: timeIcon.centerYAnchor),
            timeValueLabel.leftAnchor.constraint(equalTo: timeIcon.rightAnchor, constant: 5),
            // coast value
            coastValueLabel.centerYAnchor.constraint(equalTo: coastIcon.centerYAnchor),
            coastValueLabel.leftAnchor.constraint(equalTo: coastIcon.rightAnchor, constant: 5),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    // configuration
    func configure(recipe: Recipe) {
        recipeTitle.text = recipe.title
        guard let url = recipe.image else { return }
        previewImage.sd_setImage(with: URL(string: url))
        let difficulty = DifficultyProperty().calculateDifficulty(recipe: recipe)
        difficultyProperty.setupDifficulty(difficulty: difficulty)
        guard let calories = recipe.weightWatcherSmartPoints else { return }
        caloriesValueLabel.text = "\(calories*35) KCal"
        let time = recipe.readyInMinutes
        timeValueLabel.text = "\(time - 5)-\(time + 5) min "
        guard let coast = recipe.pricePerServing else { return }
        let price = String(format: "%.2f", coast/100)
        coastValueLabel.text = "\(price) $"
    }
}
