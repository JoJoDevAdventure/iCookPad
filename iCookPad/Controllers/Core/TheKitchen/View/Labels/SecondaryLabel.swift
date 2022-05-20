//
//  SecondaryLabel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 17/05/2022.
//

import UIKit

class SecondaryLabel: UILabel {

    func configure(fontSize: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: fontSize, weight: .regular)
        textColor = UIColor.LabelColors.secondLabelColor
    }

}
