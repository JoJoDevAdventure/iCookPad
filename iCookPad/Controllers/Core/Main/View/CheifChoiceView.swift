//
//  CheifChoiceView.swift
//  iCookPad
//
//  Created by Youssef Bhl on 18/05/2022.
//

import UIKit

class CheifChoiceView: UIView {

    private let containerView: ItemsContainerView = {
        let view = ItemsContainerView()
        view.configure()
        return view
    }()
    
    let previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        return image
    }()
    
    let recipeTitle: TitleLabel = {
        let label = TitleLabel()
        label.text  = "XXXXXXXX XXXX XXXXXXX XXX XXXXXXXXXXXX XXX XXXXXXXXX"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.configure(fontSize: 24)
        return label
    }()
    
    let recipdeDesc: SecondaryLabel = {
        let label = SecondaryLabel()
        label.text = "xxxxxx xx xxxx xxxxxxxxx xxx xx xx xx xxxxxxxx xxxxx xxx xx xxxx xxxxxxxxx xxx xx xx xx xxxxxxxx xx xxxxxx xx xxxx xxxxxxxxx xxx xx xx xx xxxxxxxx xx"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.configure(fontSize: 20)
        return label
    }()
    
    let ingredientsPropretyView: PropretyContainerView = {
        let view = PropretyContainerView()
        view.configure(proprety: "Ingredients : ", Value: "5")
        return view
    }()
    
    let caloriesPropretyView: PropretyContainerView = {
        let view = PropretyContainerView()
        view.configure(proprety: "Calories : ", Value: "1400 KCal")
        return view
    }()
    
    let coastPropretyView: PropretyContainerView = {
        let view = PropretyContainerView()
        view.configure(proprety: "Coast : ", Value: "45 $")
        return view
    }()
    
    let timePropretyView: PropretyContainerView = {
        let view = PropretyContainerView()
        view.configure(proprety: "Preparation Time : ", Value: "45 - 55 min")
        return view
    }()
    
    let difficultyPropretyView: DifficultyContainerView = {
        let view = DifficultyContainerView()
        view.configure()
        return view
    }()
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        addSubview(containerView)
        containerView.addSubview(previewImage)
        containerView.addSubview(recipeTitle)
        containerView.addSubview(recipdeDesc)
        containerView.addSubview(ingredientsPropretyView)
        containerView.addSubview(caloriesPropretyView)
        containerView.addSubview(coastPropretyView)
        containerView.addSubview(timePropretyView)
        containerView.addSubview(difficultyPropretyView)
    }
    
    private func setupConstraints() {
        let constraints = [
            //container view
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //preview image
            previewImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30),
            previewImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            previewImage.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.45),
            previewImage.widthAnchor.constraint(equalTo: previewImage.heightAnchor, multiplier: 1.2),
            
            //containerTitle
            recipeTitle.leftAnchor.constraint(equalTo: previewImage.rightAnchor, constant: 10),
            recipeTitle.topAnchor.constraint(equalTo: previewImage.topAnchor),
            recipeTitle.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            
            //container desc
            recipdeDesc.leftAnchor.constraint(equalTo: recipeTitle.leftAnchor),
            recipdeDesc.rightAnchor.constraint(equalTo: recipeTitle.rightAnchor),
            recipdeDesc.topAnchor.constraint(equalTo: recipeTitle.bottomAnchor, constant: 10),
            
            //calories proprety
            caloriesPropretyView.heightAnchor.constraint(equalToConstant: 70),
            caloriesPropretyView.widthAnchor.constraint(equalToConstant: 165),
            caloriesPropretyView.topAnchor.constraint(equalTo: previewImage.bottomAnchor, constant: 35),
            caloriesPropretyView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            //ingredient proprety
            ingredientsPropretyView.heightAnchor.constraint(equalToConstant: 70),
            ingredientsPropretyView.widthAnchor.constraint(equalToConstant: 165),
            ingredientsPropretyView.topAnchor.constraint(equalTo: caloriesPropretyView.topAnchor),
            ingredientsPropretyView.rightAnchor.constraint(equalTo: caloriesPropretyView.leftAnchor,constant: -40),
            
            //coast proprety
            coastPropretyView.heightAnchor.constraint(equalToConstant: 70),
            coastPropretyView.widthAnchor.constraint(equalToConstant: 165),
            coastPropretyView.topAnchor.constraint(equalTo: caloriesPropretyView.topAnchor),
            coastPropretyView.leftAnchor.constraint(equalTo: caloriesPropretyView.rightAnchor, constant: 40),
            
            //preparation Time proprety
            timePropretyView.heightAnchor.constraint(equalToConstant: 70),
            timePropretyView.widthAnchor.constraint(equalToConstant: 220),
            timePropretyView.topAnchor.constraint(equalTo: caloriesPropretyView.bottomAnchor, constant: 27),
            timePropretyView.leftAnchor.constraint(equalTo: ingredientsPropretyView.leftAnchor),
            
            //difficulty proprety
            difficultyPropretyView.heightAnchor.constraint(equalToConstant: 70),
            difficultyPropretyView.topAnchor.constraint(equalTo: timePropretyView.topAnchor),
            difficultyPropretyView.widthAnchor.constraint(equalToConstant: 320),
            difficultyPropretyView.rightAnchor.constraint(equalTo: coastPropretyView.rightAnchor),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }

    
    func setupWith(difficulty: Int, recipe: Recipe) {
        difficultyPropretyView.setupDifficulty(difficulty: difficulty)
        recipeTitle.text = recipe.title
        recipdeDesc.text = recipe.summary
        ingredientsPropretyView.configure(proprety: "Ingredients :", Value: <#T##String#>)
    }
}
