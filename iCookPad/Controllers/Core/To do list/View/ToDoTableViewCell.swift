//
//  ToDoTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 10/06/2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private lazy var container: ItemsContainerView = {
        let container = ItemsContainerView()
        container.configure()
        container.layer.cornerRadius = 30
        return container
    }()
    
    private lazy var previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        image.layer.cornerRadius = 23
        image.backgroundColor = .lightGray
        return image
    }()
    
    private lazy var cancelRecipe: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "x.circle")
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor.Buttons.redButton
        return image
    }()
    
    private lazy var validateRecipe: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "checkmark.circle")
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor.Buttons.greenButton
        return image
    }()
    
    private lazy var title
    
    // MARK: - View Model
    
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupSubviews()
        setupConstraints()
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
            
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    private func configureCell(recipe: RecipeCD) {
        
    }
    
}
