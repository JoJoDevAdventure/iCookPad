//
//  TitleLabel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import UIKit

class TitleLabel: UILabel {

    func configure() {
        font = .systemFont(ofSize: 32, weight: .semibold)
        textColor = UIColor.LabelColors.mainTitleColor
        translatesAutoresizingMaskIntoConstraints = false
    }

}
