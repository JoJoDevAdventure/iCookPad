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
        label.configure()
        return label
    }()
    
    private let containerView: ItemsContainerView = {
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
        addSubview(containerView)
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        let constraints = [
            //title
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            
            //container view
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            
            //
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    
}
