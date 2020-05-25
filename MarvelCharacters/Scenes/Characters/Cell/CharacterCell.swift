//
//  CharacterCell.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    
    // MARK: Properties
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.black.cgColor
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Arial(withWeight: .bold, size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.sizeToFit()
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    static let identifier: String = "characterCell"
    
    // MARK: Object Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createSubviews()
        setupCellLayout()
        setupImageView()
        setupBlackView()
        setupCharacterNameLabel()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    // MARK: Setup Layout Methods
    
    private func setupCellLayout() {
        layer.cornerRadius = 5
    }
    
    private func createSubviews() {
        addSubview(imageView)
        addSubview(blackView)
        addSubview(characterNameLabel)
    }
    
    private func setupImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupBlackView() {
        NSLayoutConstraint.activate([
            blackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            blackView.heightAnchor.constraint(equalToConstant: frame.height * 0.25)
        ])
    }
    
    private func setupCharacterNameLabel() {
        NSLayoutConstraint.activate([
            characterNameLabel.centerXAnchor.constraint(equalTo: blackView.centerXAnchor),
            characterNameLabel.centerYAnchor.constraint(equalTo: blackView.centerYAnchor),
            characterNameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: blackView.leadingAnchor, constant: 5),
            characterNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: blackView.trailingAnchor, constant: 5)
        ])
    }
    
    // MARK: Public Methods
    
    func attachPresenter(_ presenter: CharacterCellPresenter) {
        presenter.attachView(self)
    }
    
}

// MARK: CharacterCellView Interface Implementation

extension CharacterCell: CharacterCellView {
    
    func setTitle(with text: String) {
        characterNameLabel.text = text
    }
    
    func setImage(with imageUrl: String) {
        imageView.loadImage(from: imageUrl)
    }
    
}

