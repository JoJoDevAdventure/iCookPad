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
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3,
                                          height: 3)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.8
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        
    }

}
