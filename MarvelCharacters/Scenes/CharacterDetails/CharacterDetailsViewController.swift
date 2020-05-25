//
//  CharacterDetailsViewController.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class CharacterDetailsViewController: CustomViewController {
    
    // MARK: Properties
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let contentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.black.cgColor
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Arial(withWeight: .bold, size: 26)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let characterDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.Arial(withWeight: .regular, size: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var comicsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Check Comics!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .Arial(withWeight: .bold, size: 20)
        button.backgroundColor = .marvelRed
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(comicsButtonDidTap), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let presenter: CharacterDetailsPresenter
    
    // MARK: Object Lifecycle
    
    init(presenter: CharacterDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    // MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createSubviews()
        setupScrollView()
        setupContentView()
        setupImageView()
        setupCharacterNameLabel()
        setupCharacterDescriptionLabel()
        setupComicsButton()
        
        presenter.viewDidLoad()
    }
    
    // MARK: Setup Layout Methods
    
    private func createSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(characterDescriptionLabel)
        contentView.addSubview(comicsButton)
    }
    
    private func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    private func setupImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.4)
        ])
    }
    
    private func setupCharacterNameLabel() {
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 7),
            characterNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            characterNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupCharacterDescriptionLabel() {
        NSLayoutConstraint.activate([
            characterDescriptionLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 10),
            characterDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            characterDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupComicsButton() {
        NSLayoutConstraint.activate([
            comicsButton.topAnchor.constraint(equalTo: characterDescriptionLabel.bottomAnchor, constant: 40),
            comicsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            comicsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            comicsButton.heightAnchor.constraint(equalToConstant: 50),
            comicsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: Tap Button Methods
    
    @objc private func comicsButtonDidTap() {
        presenter.comicsButtonDidTap()
    }
    
}

// MARK: CharacterDetailsViewController Interface Implementation

extension CharacterDetailsViewController: CharacterDetailsView {
    
    func setImage(with imageUrl: String) {
        imageView.loadImage(from: imageUrl)
    }
    
    func setCharacterName(with text: String) {
        characterNameLabel.text = text
    }
    
    func setCharacterDescription(with text: String) {
        characterDescriptionLabel.text = text
    }
    
    func setNavigationTitle(with text: String) {
        navigationTitleLabel.text = text
    }
    
    func shouldShowComicsButton(show: Bool) {
        comicsButton.isHidden = !show
    }
    
}
