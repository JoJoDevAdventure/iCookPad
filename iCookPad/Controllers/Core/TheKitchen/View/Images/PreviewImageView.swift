//
//  PreviewImageView.swift
//  iCookPad
//
//  Created by Youssef Bhl on 16/05/2022.
//

import UIKit

class PreviewImageView: UIImageView {

    func configure() {
        
        layer.cornerRadius = 30
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.lightGray.cgColor
        backgroundColor = .lightGray
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4,
                                          height: 4)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.3
        translatesAutoresizingMaskIntoConstraints = false
    }

}
