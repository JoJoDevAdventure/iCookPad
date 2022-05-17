//
//  PropretyContainerView.swift
//  iCookPad
//
//  Created by Youssef Bhl on 17/05/2022.
//

import Foundation
import UIKit

class PropretyContainerView : UIView {
    
    private let propretyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.LabelColors.secondLabelColor
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    func configure(proprety: String, Value: String) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        addSubview(propretyLabel)
        addSubview(valueLabel)
        
        setupConstraints()
        
        valueLabel.text = Value
        propretyLabel.text = proprety
        
        layer.cornerRadius = 10
        
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.2
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.2
        
    }
    
    func setupConstraints() {
        let contraints = [
            propretyLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15),
            propretyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ]
        NSLayoutConstraint.activate(contraints)
    }
    
}
