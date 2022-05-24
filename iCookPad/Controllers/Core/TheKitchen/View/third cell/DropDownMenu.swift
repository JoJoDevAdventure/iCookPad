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
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    let dropDownMenu = DropDown()
    
    func setup(title: String, selectionItems: [String]) {
        menuSelectedLabel.text = title
        dropDownMenu.dataSource = selectionItems
    }
    
    func configure() {
        backgroundColor = .white
        setupConstraints()
        setupDropDownMenu()
        setupGesture()
    }
    
    private func setupDropDownMenu() {
        dropDownMenu.anchorView = self
        dropDownMenu.selectionAction = {[unowned self] (index: Int, item: String) in
            menuSelectedLabel.text = item
        }
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(menuSelectedLabel)
        let constraints = [
            // selection
            heightAnchor.constraint(equalToConstant: 40),
            widthAnchor.constraint(equalToConstant: 150),
            
            // selected item label
            menuSelectedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            menuSelectedLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuSelectedLabel.widthAnchor.constraint(equalTo:widthAnchor),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupGesture() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(deployMenu)))
    }
    
    @objc func deployMenu() {
        dropDownMenu.show()
    }
    
    func getSelectedItem() -> String? {
        return dropDownMenu.selectedItem
    }
    
}

