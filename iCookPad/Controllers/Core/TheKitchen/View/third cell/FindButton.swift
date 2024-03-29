//
//  FindButton.swift
//  iCookPad
//
//  Created by Youssef Bhl on 31/05/2022.
//

import UIKit

class FindButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        backgroundColor = .systemGreen
        translatesAutoresizingMaskIntoConstraints = false
        setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        tintColor = .white
        layer.cornerRadius = 25
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.3
    }

}
