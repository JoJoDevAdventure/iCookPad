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
        label.text = "Today's chief choice :"
        label.configure(fontSize: 38)
        return label
    }()
    
    private let chefChoiceView: CheifChoiceView = {
        let view = CheifChoiceView()
        view.configure()
        return view
    }()
    
    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.BackgroundColors.background
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set up
    
    private func setupSubViews() {
        addSubview(titleLabel)
        addSubview(chefChoiceView)
        
    }
    
    private func setupConstraints() {
        let constraints = [
            //title
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            
            //container view
            chefChoiceView.centerXAnchor.constraint(equalTo: centerXAnchor),
            chefChoiceView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            chefChoiceView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.84),
            chefChoiceView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    func configureWith(recipe: Recipe) {
        chefChoiceView.setupWith(recipe: recipe)
    }
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    
}
