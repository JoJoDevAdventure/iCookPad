//
//  iconImageView.swift
//  iCookPad
//
//  Created by Youssef Bhl on 22/05/2022.
//

import UIKit

class iconImageView: UIImageView {

    func configure(iconName: String, size: CGFloat) {
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: iconName)
        widthAnchor.constraint(equalToConstant: size).isActive = true
        heightAnchor.constraint(equalToConstant: size).isActive = true
    }

}
