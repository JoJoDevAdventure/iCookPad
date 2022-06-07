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
        return scrollView
    }()
    
    //Title
    private lazy var titleLabel: TitleLabel = {
        let title = TitleLabel()
        title.configure(fontSize: 42)
        title.text = "Test Recipe Title"
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
        label.isEditable = false
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - View Model
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Set up
    
    
    // MARK: - Functions
    
    
    // MARK: - Extensions
    
    
}
