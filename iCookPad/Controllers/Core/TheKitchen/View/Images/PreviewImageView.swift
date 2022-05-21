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
        clipsToBounds = true
        backgroundColor = .lightGray
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3,
                                          height: 3)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.4
        translatesAutoresizingMaskIntoConstraints = false
    }

}
