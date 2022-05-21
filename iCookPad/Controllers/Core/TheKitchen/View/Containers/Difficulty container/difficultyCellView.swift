//
//  difficultyCellView.swift
//  iCookPad
//
//  Created by Youssef Bhl on 17/05/2022.
//

import UIKit

class DifficultyCellView: UIView {
    
    func configure(levelOfDifficulty: Int) {
        layer.cornerRadius = 7
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        
        switch levelOfDifficulty {
        case 1 : backgroundColor = UIColor.DifficultyColors.difficulty1
        case 2 : backgroundColor = UIColor.DifficultyColors.difficulty2
        case 3 : backgroundColor = UIColor.DifficultyColors.difficulty3
        case 4 : backgroundColor = UIColor.DifficultyColors.difficulty4
        case 5 : backgroundColor = UIColor.DifficultyColors.difficulty5
        case 6 : backgroundColor = UIColor.DifficultyColors.difficulty6
            
        default :
            backgroundColor = .lightGray
        }
    }
    

}
