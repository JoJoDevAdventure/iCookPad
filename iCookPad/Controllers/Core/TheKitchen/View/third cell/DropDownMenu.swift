//
//  DropDownMenu.swift
//  iCookPad
//
//  Created by Youssef Bhl on 24/05/2022.
//

import UIKit
import DropDown
import Foundation

class DropDownMenu: UIView {
    
    private let menuSelectedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .light)
        return label
    }()
    
    private let downButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        return button
    }()
    
    let dropDownMenu = DropDown()
    
    func setup(title: String, selectionItems: [String]) {
        menuSelectedLabel.text = title
        dropDownMenu.dataSource = selectionItems
    }
    
    func configure() {
        clipsToBounds = true
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0,
                                          height: 0)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        setupConstraints()
        setupDropDownMenu()
        setupGesture()
    }
    
    private func setupDropDownMenu() {
        dropDownMenu.anchorView = self
        dropDownMenu.selectionAction = {[unowned self] (index: Int, item: String) in
            menuSelectedLabel.text = item
        }
        dropDownMenu.backgroundColor = .white
        dropDownMenu.selectedTextColor = .black
        dropDownMenu.selectionBackgroundColor = .lightGray
        dropDownMenu.cornerRadius = 7
        dropDownMenu.animationEntranceOptions = .transitionFlipFromTop
        dropDownMenu.animationExitOptions = .transitionFlipFromBottom
        dropDownMenu.animationduration = 0.5
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(menuSelectedLabel)
        addSubview(downButton)
        let constraints = [
            // selection
            heightAnchor.constraint(equalToConstant: 50),
            widthAnchor.constraint(equalToConstant: 220),
            
            // selected item label
            menuSelectedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            menuSelectedLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuSelectedLabel.widthAnchor.constraint(equalTo:widthAnchor, constant: -20),
            
            // drop down button
            downButton.rightAnchor.constraint(equalTo: rightAnchor),
            downButton.heightAnchor.constraint(equalTo: heightAnchor),
            downButton.widthAnchor.constraint(equalToConstant: 35),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupGesture() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(deployMenu)))
        downButton.addAction(UIAction(handler: { _ in
            self.deployMenu()
        }), for: .touchUpInside)
    }
    
    @objc func deployMenu() {
        dropDownMenu.show()
    }
    
    func getSelectedItem() -> String? {
        return dropDownMenu.selectedItem
    }
    
}

