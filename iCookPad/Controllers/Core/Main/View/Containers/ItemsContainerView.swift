//
//  ItemsContainerView.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import UIKit

class ItemsContainerView: UIView {

    func configure() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 50
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4,
                                          height: 4)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.3
    }

}
