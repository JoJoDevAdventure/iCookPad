//
//  DifficultyContainerView.swift
//  iCookPad
//
//  Created by Youssef Bhl on 17/05/2022.
//

import UIKit

class DifficultyContainerView: UIView {
    
    private let difficultyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()

    func configure() {
        layer.cornerRadius = 10
    }

}
