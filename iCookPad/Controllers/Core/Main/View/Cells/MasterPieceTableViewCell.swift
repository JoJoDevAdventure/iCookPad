//
//  MasterPieceTableViewCell.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import UIKit

class MasterPieceTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "MasterPieceTableViewCell"
    
    
    private let titleLabel: TitleLabel = {
        let label = TitleLabel()
        label.text = "Today's cheif choices :"
        label.configure(fontSize: 32)
        return label
    }()
    
    private let containerView: ItemsContainerView = {
        let view = ItemsContainerView()
        view.configure()
        return view
    }()
    
    let previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        return image
    }()
    
    let recipeTitle: TitleLabel = {
        let label = TitleLabel()
        label.text  = "XXXXXXXX XXXX XXXXXXX XXX XXXXXXXXXXXX XXX XXXXXXXXX"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.configure(fontSize: 24)
        return label
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
        addSubview(containerView)
        addSubview(titleLabel)
        containerView.addSubview(previewImage)
        containerView.addSubview(recipeTitle)
    }
    
    private func setupConstraints() {
        let constraints = [
            //title
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            
            //container view
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            
            //preview image
            previewImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30),
            previewImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            previewImage.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.45),
            previewImage.widthAnchor.constraint(equalTo: previewImage.heightAnchor, multiplier: 1.2),
            
            //containerTitle
            recipeTitle.leftAnchor.constraint(equalTo: previewImage.rightAnchor, constant: 10),
            recipeTitle.topAnchor.constraint(equalTo: previewImage.topAnchor),
            recipeTitle.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    
}
