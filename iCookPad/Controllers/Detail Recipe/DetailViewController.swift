//
//  DetailViewController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 02/06/2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    let recipe : Recipe
    
    // MARK: - UI
    //scroll view
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0
        return scrollView
    }()
    
    //Title
    private lazy var titleLabel: TitleLabel = {
        let title = TitleLabel()
        title.configure(fontSize: 42)
        title.text = "Test Recipe Title"
        title.textAlignment = .center
        title.numberOfLines = 3
        return title
    }()
    
    // Preview image
    private lazy var previewImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        return image
    }()
    
    // descriprion TextView
    private lazy var recipdeDesc: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor.LabelColors.secondLabelColor
        label.isScrollEnabled = true
        label.text = "xxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xxxxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxx"
        label.isEditable = false
        label.backgroundColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        label.layer.borderWidth = 0.2
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 4,
                                    height: 4)
        label.layer.shadowRadius = 6
        label.layer.shadowOpacity = 0.3
        return label
    }()
    
    //Propreties:
    // cal
    private lazy var caloriesProprety: PropretyContainerView = {
        let proprety = PropretyContainerView()
        proprety.configure(proprety: "Calories :", Value: "1200 KCal")
        return proprety
    }()
    
    // steps
    private lazy var stepsProprety: PropretyContainerView = {
        let proprety = PropretyContainerView()
        proprety.configure(proprety: "Steps :", Value: "12")
        return proprety
    }()
    
    // coast
    private lazy var coastProprety: PropretyContainerView = {
        let proprety = PropretyContainerView()
        proprety.configure(proprety: "Coast :", Value: "12 $")
        return proprety
    }()
    
    // time
    private lazy var timeProprety: PropretyContainerView = {
        let proprety = PropretyContainerView()
        proprety.configure(proprety: "Preparation time :", Value: "15-30 min")
        return proprety
    }()
    
    // ingredients :
    // label :
    private lazy var ingredientsLabel: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 24)
        label.text = "Needed ingredients : "
        return label
    }()
    
    // ingredients image :
    private lazy var ingredientsImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        image.layer.cornerRadius = 20
        image.contentMode = .top
        return image
    }()
    
    // equipement :
    // equipement label :
    private lazy var equipmentsLabel: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 24)
        label.text = "Needed equipments : "
        label.alpha = 0.2
        return label
    }()
    
    //equipement image :
    private lazy var equipmentsImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        image.layer.cornerRadius = 20
        image.alpha = 0
        image.contentMode = .top
        return image
    }()
    
    // taste :
    // taste label :
    private lazy var tasteLabel: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 24)
        label.text = "It tastes like ... "
        return label
    }()
    
    //taste image :
    private lazy var tasteImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // coast :
    // coast label :
    private lazy var coastLabel: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 24)
        label.text = "It coasts ... "
        return label
    }()
    
    // coast image :
    private lazy var coastImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // contains :
    // coast label :
    private lazy var nutrimentLabel: TitleLabel = {
        let label = TitleLabel()
        label.configure(fontSize: 24)
        label.text = "Contains those nutriments ... "
        return label
    }()
    
    // coast image :
    private lazy var nutrimentImage: PreviewImageView = {
        let image = PreviewImageView()
        image.configure()
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: - View Model
    
    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        view.isUserInteractionEnabled = true
    }
    
    // MARK: - Set up
    private func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(previewImage)
        scrollView.addSubview(recipdeDesc)
        scrollView.addSubview(caloriesProprety)
        scrollView.addSubview(stepsProprety)
        scrollView.addSubview(coastProprety)
        scrollView.addSubview(timeProprety)
        scrollView.addSubview(ingredientsLabel)
        scrollView.addSubview(ingredientsImage)
        scrollView.addSubview(equipmentsLabel)
        scrollView.addSubview(equipmentsImage)
        scrollView.addSubview(tasteLabel)
        scrollView.addSubview(tasteImage)
        scrollView.addSubview(coastLabel)
        scrollView.addSubview(coastImage)
        scrollView.addSubview(nutrimentImage)
        scrollView.addSubview(nutrimentLabel)
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.frame = view.frame
        scrollView.delegate = self
    }
    
    private func setupConstraints() {
        let constraints = [
            // Title constraints
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -300),
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            
            // PreviewImage
            previewImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.45),
            previewImage.heightAnchor.constraint(equalTo: previewImage.widthAnchor, multiplier: 0.85),
            previewImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            previewImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            
            // Description
            recipdeDesc.widthAnchor.constraint(equalTo: previewImage.widthAnchor),
            recipdeDesc.heightAnchor.constraint(equalTo: previewImage.heightAnchor),
            recipdeDesc.leftAnchor.constraint(equalTo: previewImage.rightAnchor, constant: 25),
            recipdeDesc.topAnchor.constraint(equalTo: previewImage.topAnchor),
            
            // Propreties:
            // calories
            caloriesProprety.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2),
            caloriesProprety.topAnchor.constraint(equalTo: previewImage.bottomAnchor, constant: 70),
            caloriesProprety.heightAnchor.constraint(equalToConstant: 70),
            caloriesProprety.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            //steps
            stepsProprety.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.15),
            stepsProprety.heightAnchor.constraint(equalToConstant: 70),
            stepsProprety.leftAnchor.constraint(equalTo: caloriesProprety.rightAnchor, constant: 20),
            stepsProprety.topAnchor.constraint(equalTo: caloriesProprety.topAnchor),
            
            // coast
            coastProprety.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2),
            coastProprety.heightAnchor.constraint(equalToConstant: 70),
            coastProprety.leftAnchor.constraint(equalTo: stepsProprety.rightAnchor, constant: 20),
            coastProprety.topAnchor.constraint(equalTo: stepsProprety.topAnchor),
            
            // prep time
            timeProprety.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3),
            timeProprety.heightAnchor.constraint(equalToConstant: 70),
            timeProprety.leftAnchor.constraint(equalTo: coastProprety.rightAnchor, constant: 20),
            timeProprety.topAnchor.constraint(equalTo: coastProprety.topAnchor),
            
            // Ingredients :
            // label :
            ingredientsLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50),
            ingredientsLabel.topAnchor.constraint(equalTo: timeProprety.bottomAnchor, constant: 50),
            
            // image :
            ingredientsImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            ingredientsImage.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 30),
            ingredientsImage.heightAnchor.constraint(equalTo: ingredientsImage.widthAnchor, multiplier: 0.4),
            ingredientsImage.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            // equipments :
            // label :
            equipmentsLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50),
            equipmentsLabel.topAnchor.constraint(equalTo: ingredientsImage.bottomAnchor, constant: 50),
            
            // image :
            equipmentsImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            equipmentsImage.heightAnchor.constraint(equalTo: ingredientsImage.widthAnchor, multiplier: 0.4),
            equipmentsImage.topAnchor.constraint(equalTo: equipmentsLabel.bottomAnchor, constant: 30),
            equipmentsImage.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            // taste :
            // label :
            tasteLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50),
            tasteLabel.topAnchor.constraint(equalTo: equipmentsImage.bottomAnchor, constant: 50),
            
            //image :
            tasteImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.7),
            tasteImage.heightAnchor.constraint(equalTo: tasteImage.widthAnchor),
            tasteImage.topAnchor.constraint(equalTo: tasteLabel.bottomAnchor, constant: 30),
            tasteImage.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            // taste :
            // label :
            coastLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50),
            coastLabel.topAnchor.constraint(equalTo: tasteImage.bottomAnchor, constant: 50),
            
            //image :
            coastImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            coastImage.heightAnchor.constraint(equalTo: coastImage.widthAnchor,multiplier: 0.5),
            coastImage.topAnchor.constraint(equalTo: coastLabel.bottomAnchor, constant: 30),
            coastImage.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            // nutriment :
            // label :
            nutrimentLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50),
            nutrimentLabel.topAnchor.constraint(equalTo: coastImage.bottomAnchor, constant: 50),
            
            // image :
            nutrimentImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.7),
            nutrimentImage.heightAnchor.constraint(equalTo: nutrimentImage.widthAnchor,multiplier: 1.2),
            nutrimentImage.topAnchor.constraint(equalTo: nutrimentLabel.bottomAnchor, constant: 30),
            nutrimentImage.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            nutrimentImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -400),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    
    // MARK: - Extensions
    
    private func configure() {
        previewImage.sd_setImage(with: URL(string: recipe.image ?? ""))
        recipdeDesc.text = recipe.summary?.html2String
        caloriesProprety.configure(proprety: "Calories :", Value: "\(recipe.weightWatcherSmartPoints ?? 0*30) KCal")
        stepsProprety.configure(proprety: "Steps :", Value: "\(recipe.extendedIngredients?.count ?? 0)")
        coastProprety.configure(proprety: "Coast :", Value: "\(recipe.pricePerServing ?? 0) $")
        timeProprety.configure(proprety: "Preparation time :", Value: "\(recipe.readyInMinutes-5) - \(recipe.readyInMinutes+5) min")
//        let urlToIngredientsImage = "https://api.spoonacular.com/recipes/\(recipe.id!)/ingredientWidget.png?\(APIInformations().apiKeyUrlBase)\(APIInformations().apiKey)&view=list&defaultCss=false"
//        let urlToEquipment = "https://api.spoonacular.com/recipes/\(recipe.id!)/equipmentWidget.png?\(APIInformations().apiKeyUrlBase)\(APIInformations().apiKey)"
//        let urlToTaste = "https://api.spoonacular.com/recipes/\(recipe.id!)/tasteWidget.png?\(APIInformations().apiKeyUrlBase)\(APIInformations().apiKey)"
//        let urlToPrice = "https://api.spoonacular.com/recipes/\(recipe.id!)/priceBreakdownWidget.png?\(APIInformations().apiKeyUrlBase)\(APIInformations().apiKey)"
//        let urlToNutriments = "https://api.spoonacular.com/recipes/\(recipe.id!)/nutritionWidget.png?\(APIInformations().apiKeyUrlBase)\(APIInformations().apiKey)"
//        ingredientsImage.sd_setImage(with: URL(string: urlToIngredientsImage)) { image, _, _, _ in
//            self.ingredientsImage.heightAnchor.constraint(equalToConstant: image!.size.height).isActive = true
//        }
//
//        ingredientsImage.backgroundColor = UIColor.BackgroundColors.background
//        equipmentsImage.sd_setImage(with: URL(string: urlToEquipment))
//        tasteImage.sd_setImage(with: URL(string: urlToTaste))
//        coastImage.sd_setImage(with: URL(string: urlToPrice))
//        nutrimentImage.sd_setImage(with: URL(string: urlToNutriments))
   }
    
}
extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y + 24
        if scrollView.contentOffset.y < 24 {
            offset = 0
        }
        print(offset)
        previewImage.transform = CGAffineTransform(translationX: -offset, y: 0)
        previewImage.alpha = 1-(offset/450)
        recipdeDesc.transform = CGAffineTransform(translationX: offset, y: 0)
        recipdeDesc.alpha = 1-(offset/450)
        
        equipmentsLabel.alpha = (offset/380)+0.2
        equipmentsImage.alpha = offset/440
        tasteLabel.alpha = (offset-380)/(620-380)
        tasteImage.alpha = (offset-420)/(680-420)
        coastLabel.alpha = (offset-1000) / (1260-1000)
        coastImage.alpha = (offset-1020) / (1300-1020)
        nutrimentLabel.alpha = (offset-1650) / (1850-1650)
        nutrimentImage.alpha = (offset-1680) / (1890-1680)
        
        if offset > 320 {
            caloriesProprety.transform = CGAffineTransform(translationX: -offset+320, y: 0)
            timeProprety.transform = CGAffineTransform(translationX: offset-320, y: 0)
        }
        if offset > 360 {
            stepsProprety.transform = CGAffineTransform(translationX: -offset+360, y: 0)
            coastProprety.transform = CGAffineTransform(translationX: offset-360, y: 0)
        }
        if offset > 580 {
            ingredientsLabel.alpha = 1-((offset-580)/(900-580))
            ingredientsLabel.transform = CGAffineTransform(translationX: -offset+580, y: 0)
        }
        
        if offset > 620 {
            ingredientsImage.alpha = 1-((offset-620)/(930-620))
            ingredientsImage.transform = CGAffineTransform(translationX: offset-620, y: 0)
        }
        
        if offset > 990 {
            equipmentsLabel.alpha = 1-((offset-990)/(1030-990))
            equipmentsLabel.transform = CGAffineTransform(translationX: -offset+990, y: 0)
        }
        
        if offset > 1030 {
            equipmentsImage.alpha = 1-((offset-1030)/(1280-1030))
            equipmentsImage.transform = CGAffineTransform(translationX: offset-1030, y: 0)
        }
        
        if offset > 1360 {
            tasteLabel.alpha = 1-((offset-1360)/(1650-1360))
            tasteLabel.transform = CGAffineTransform(translationX: -offset+1360, y: 0)
        }
        
        if offset > 1400 {
            tasteImage.alpha = 1-((offset-1400)/(1800-1400))
            tasteImage.transform = CGAffineTransform(translationX: offset-1400, y: 0)
        }
        
        if offset > 2020 {
            coastLabel.alpha = 1-((offset-2020)/(2185-2020))
            coastLabel.transform = CGAffineTransform(translationX: -offset+2020, y: 0)
        }
        
        if offset > 2060 {
            coastImage.alpha = 1-((offset-2060)/(2440-2060))
            coastImage.transform = CGAffineTransform(translationX: offset-2060, y: 0)
        }
        
    }
    
}
