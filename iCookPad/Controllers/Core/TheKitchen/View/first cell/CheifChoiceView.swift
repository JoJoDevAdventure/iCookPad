//
//  CheifChoiceView.swift
//  iCookPad
//
//  Created by Youssef Bhl on 18/05/2022.
//

import UIKit
import SDWebImage

class CheifChoiceView: UIView {

    //rounded container view
    private let containerView: ItemsContainerView = {
        let view = ItemsContainerView()
        view.configure()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    //image preview
    let previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        return image
    }()
    
    // name of recipe
    let recipeTitle: TitleLabel = {
        let label = TitleLabel()
        label.text  = ""
        label.numberOfLines = 3
        label.textAlignment = .center
        label.configure(fontSize: 24)
        return label
    }()
    
    // description of recipe
    let recipdeDesc: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor.LabelColors.secondLabelColor
        label.isScrollEnabled = true
        label.isEditable = false
        return label
    }()
    
    //number of steps / ingredients
    let ingredientsPropretyView: PropretyContainerView = {
        let view = PropretyContainerView()
        view.configure(proprety: "", Value: "")
        return view
    }()
    
    //number of calories
    let caloriesPropretyView: PropretyContainerView = {
        let view = PropretyContainerView()
        view.configure(proprety: "", Value: "")
        return view
    }()
    
    //coast property view
    let coastPropretyView: PropretyContainerView = {
        let view = PropretyContainerView()
        view.configure(proprety: "", Value: "")
        return view
    }()
    
    //time of preparation
    let timePropretyView: PropretyContainerView = {
        let view = PropretyContainerView()
        view.configure(proprety: "", Value: "")
        return view
    }()
    
    //difficulty
    let difficultyPropretyView: DifficultyContainerView = {
        let view = DifficultyContainerView()
        view.configure()
        view.setupDifficulty(difficulty: 0)
        return view
    }()
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        addSubViews()
        setupConstraints()
    }
    
    //MARK: - Setup
    
    private func addSubViews() {
        addSubview(containerView)
        containerView.addSubview(previewImage)
        containerView.addSubview(recipeTitle)
        addSubview(recipdeDesc)
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
            recipdeDesc.bottomAnchor.constraint(equalTo: previewImage.bottomAnchor),
            
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
    
    //setup chief choice view with api informations
    func setupWith(recipe: Recipe) {
        recipeTitle.text = recipe.title
        recipdeDesc.text = recipe.summary.html2String
        ingredientsPropretyView.configure(proprety: "Prep. steps : ", Value: "\(recipe.extendedIngredients.count)")
        caloriesPropretyView.configure(proprety: "Calories : ", Value: "\(recipe.weightWatcherSmartPoints * 35) KCal")
        let price = String(format: "Value: %.2f", recipe.pricePerServing/100)
        coastPropretyView.configure(proprety: "Coast : ", Value: "\(price) $")
        timePropretyView.configure(proprety: "Preparation Time : ", Value: "\(recipe.readyInMinutes - 5) - \(recipe.readyInMinutes + 5) min")
        previewImage.sd_setImage(with: URL(string: recipe.image))
        previewImage.configure()
        let difficulty = DifficultyProperty().calculateDifficulty(recipe: recipe)
        difficultyPropretyView.setupDifficulty(difficulty: difficulty)
    }
    
}
