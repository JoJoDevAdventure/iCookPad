//
//  ToDoTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 10/06/2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private lazy var previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        image.layer.cornerRadius = 15
        image.backgroundColor = .lightGray
        return image
    }()
    
    
    // MARK: - View Model
    
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set up
    
    private func setupSubviews() {
        addSubview(previewImage)
    }
    
    private func setupConstraints() {
        let constraints = [
            previewImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            previewImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            previewImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            previewImage.widthAnchor.constraint(equalTo: previewImage.heightAnchor, multiplier: 1.1)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    private func configureCell(recipe: RecipeCD) {
        
    }
    
}
