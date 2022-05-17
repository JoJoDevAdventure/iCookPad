//
//  TitleLabel.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import UIKit

class TitleLabel: UILabel {

    func configure(fontSize: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: fontSize, weight: .semibold)
        textColor = UIColor.LabelColors.mainTitleColor
    }

}
