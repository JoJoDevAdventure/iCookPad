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
        backgroundColor = .clear
        layer.masksToBounds = false
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
    }

}
