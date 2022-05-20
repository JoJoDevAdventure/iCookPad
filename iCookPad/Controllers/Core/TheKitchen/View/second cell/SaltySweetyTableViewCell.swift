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
    }
    
    private func setupConstraints() {
        let constraints = [
            container.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            container.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            container.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    
}
