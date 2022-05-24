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
        label.text = "You wish, We grant."
        return label
    }()
    
    // MARK: - View Model
    
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up
    
    private func setupSubviews() {
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    
}
