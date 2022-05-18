//
//  DifficultyContainerView.swift
//  iCookPad
//
//  Created by Youssef Bhl on 17/05/2022.
//

import UIKit

class DifficultyContainerView: UIView {
    
    private let difficultyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Difficulty :"
        label.textColor = UIColor.LabelColors.mainTitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let difficulty1Cell: DifficultyCellView = {
        let view = DifficultyCellView()
        view.configure(levelOfDifficulty: 1)
        return view
    }()
    
    private let difficulty2Cell: DifficultyCellView = {
        let view = DifficultyCellView()
        view.configure(levelOfDifficulty: 2)
        return view
    }()
    
    private let difficulty3Cell: DifficultyCellView = {
        let view = DifficultyCellView()
        view.configure(levelOfDifficulty: 3)
        return view
    }()
    
    private let difficulty4Cell: DifficultyCellView = {
        let view = DifficultyCellView()
        view.configure(levelOfDifficulty: 4)
        return view
    }()
    
    private let difficulty5Cell: DifficultyCellView = {
        let view = DifficultyCellView()
        view.configure(levelOfDifficulty: 5)
        return view
    }()
    
    private let difficulty6Cell: DifficultyCellView = {
        let view = DifficultyCellView()
        view.configure(levelOfDifficulty: 6)
        return view
    }()

    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        layer.cornerRadius = 10
        
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.2
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.2
        
        addSubview(difficultyLabel)
        addSubview(difficulty1Cell)
        addSubview(difficulty2Cell)
        addSubview(difficulty3Cell)
        addSubview(difficulty4Cell)
        addSubview(difficulty5Cell)
        addSubview(difficulty6Cell)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        let constraints = [
            //Label constraints
            difficultyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            difficultyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            //first difficulty
            difficulty1Cell.leftAnchor.constraint(equalTo: difficultyLabel.rightAnchor, constant: 15),
            difficulty1Cell.centerYAnchor.constraint(equalTo: centerYAnchor),
            difficulty1Cell.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            difficulty1Cell.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            //second difficulty
            difficulty2Cell.leftAnchor.constraint(equalTo: difficulty1Cell.rightAnchor, constant: 5),
            difficulty2Cell.centerYAnchor.constraint(equalTo: centerYAnchor),
            difficulty2Cell.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            difficulty2Cell.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            //third difficulty
            difficulty3Cell.leftAnchor.constraint(equalTo: difficulty2Cell.rightAnchor, constant: 5),
            difficulty3Cell.centerYAnchor.constraint(equalTo: centerYAnchor),
            difficulty3Cell.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            difficulty3Cell.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            //fourth difficulty
            difficulty4Cell.leftAnchor.constraint(equalTo: difficulty3Cell.rightAnchor, constant: 5),
            difficulty4Cell.centerYAnchor.constraint(equalTo: centerYAnchor),
            difficulty4Cell.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            difficulty4Cell.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            //fifth difficulty
            difficulty5Cell.leftAnchor.constraint(equalTo: difficulty4Cell.rightAnchor, constant: 5),
            difficulty5Cell.centerYAnchor.constraint(equalTo: centerYAnchor),
            difficulty5Cell.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            difficulty5Cell.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            //sixth difficulty
            difficulty6Cell.leftAnchor.constraint(equalTo: difficulty5Cell.rightAnchor, constant: 5),
            difficulty6Cell.centerYAnchor.constraint(equalTo: centerYAnchor),
            difficulty6Cell.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            difficulty6Cell.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupDifficulty(difficulty: Int) {
        switch difficulty {
        case 1 :
            difficulty1Cell.configure(levelOfDifficulty: 1)
            difficulty2Cell.configure(levelOfDifficulty: 0)
            difficulty3Cell.configure(levelOfDifficulty: 0)
            difficulty4Cell.configure(levelOfDifficulty: 0)
            difficulty5Cell.configure(levelOfDifficulty: 0)
            difficulty6Cell.configure(levelOfDifficulty: 0)
        case 2 :
            difficulty1Cell.configure(levelOfDifficulty: 1)
            difficulty2Cell.configure(levelOfDifficulty: 2)
            difficulty3Cell.configure(levelOfDifficulty: 0)
            difficulty4Cell.configure(levelOfDifficulty: 0)
            difficulty5Cell.configure(levelOfDifficulty: 0)
            difficulty6Cell.configure(levelOfDifficulty: 0)
        case 3 :
            difficulty1Cell.configure(levelOfDifficulty: 1)
            difficulty2Cell.configure(levelOfDifficulty: 2)
            difficulty3Cell.configure(levelOfDifficulty: 3)
            difficulty4Cell.configure(levelOfDifficulty: 0)
            difficulty5Cell.configure(levelOfDifficulty: 0)
            difficulty6Cell.configure(levelOfDifficulty: 0)
        case 4 :
            difficulty1Cell.configure(levelOfDifficulty: 1)
            difficulty2Cell.configure(levelOfDifficulty: 2)
            difficulty3Cell.configure(levelOfDifficulty: 3)
            difficulty4Cell.configure(levelOfDifficulty: 4)
            difficulty5Cell.configure(levelOfDifficulty: 0)
            difficulty6Cell.configure(levelOfDifficulty: 0)
        case 5 :
            difficulty1Cell.configure(levelOfDifficulty: 1)
            difficulty2Cell.configure(levelOfDifficulty: 2)
            difficulty3Cell.configure(levelOfDifficulty: 3)
            difficulty4Cell.configure(levelOfDifficulty: 4)
            difficulty5Cell.configure(levelOfDifficulty: 5)
            difficulty6Cell.configure(levelOfDifficulty: 0)
        case 6 :
            difficulty1Cell.configure(levelOfDifficulty: 1)
            difficulty2Cell.configure(levelOfDifficulty: 2)
            difficulty3Cell.configure(levelOfDifficulty: 3)
            difficulty4Cell.configure(levelOfDifficulty: 4)
            difficulty5Cell.configure(levelOfDifficulty: 5)
            difficulty6Cell.configure(levelOfDifficulty: 6)
            
        default :
            difficulty1Cell.configure(levelOfDifficulty: 0)
            difficulty2Cell.configure(levelOfDifficulty: 0)
            difficulty3Cell.configure(levelOfDifficulty: 0)
            difficulty4Cell.configure(levelOfDifficulty: 0)
            difficulty5Cell.configure(levelOfDifficulty: 0)
            difficulty6Cell.configure(levelOfDifficulty: 0)
        }
    }

}
