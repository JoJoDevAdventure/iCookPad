//
//  SaltySweetTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 20/05/2022.
//

import UIKit

class SaltySweetyTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "SaltySweetyTableViewCell"
    
    private let container: ItemsContainerView = {
        let view = ItemsContainerView()
        view.configure()
        return view
    }()
    
    private let recipeTitle: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 24)
        label.text = "This is recipe title"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let informationContainer: ItemsContainerView = {
        let view = ItemsContainerView()
        view.configure()
        return view
    }()
    
    private let previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.backgroundColor = .gray
        image.configure()
        return image
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
            recipeTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            
            //image preview
            previewImage.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.45),
            previewImage.heightAnchor.constraint(equalTo: previewImage.widthAnchor, multiplier: 0.9),
            previewImage.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 15),
            previewImage.topAnchor.constraint(equalTo: recipeTitle.bottomAnchor, constant: 15),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    
}
