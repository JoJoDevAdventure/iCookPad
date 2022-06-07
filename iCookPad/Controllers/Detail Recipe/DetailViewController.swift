//
//  DetailViewController.swift
//  iCookPad
//
//  Created by Youssef Bhl on 02/06/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI
    //scroll view
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
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
        label.text = "xxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxxxxxx xx xxxx x xx xx xxxxxx x xxx x x xxxxxxx x xx xx xxxxx"
        label.isEditable = false
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    // MARK: - View Model
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
    
    
    // MARK: - Set up
    private func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(previewImage)
        scrollView.addSubview(recipdeDesc)
    }
    
    private func setupConstraints() {
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Title constraints
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -300),
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            
            // PreviewImage
            previewImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.45),
            previewImage.heightAnchor.constraint(equalTo: previewImage.widthAnchor, multiplier: 0.85),
            previewImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            previewImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            
            // Description
            recipdeDesc.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.45),
            recipdeDesc.heightAnchor.constraint(equalTo: recipdeDesc.widthAnchor, multiplier: 0.85),
            recipdeDesc.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -30),
            recipdeDesc.topAnchor.constraint(equalTo: previewImage.topAnchor),
            recipdeDesc.centerYAnchor.constraint(equalTo: previewImage.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    
    // MARK: - Extensions
    
    
}
