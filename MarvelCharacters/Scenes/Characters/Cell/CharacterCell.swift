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
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "test")
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Arial(withWeight: .bold, size: 22)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.sizeToFit()
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Spider-Man"
        
        return label
    }()
    
    static let identifier: String = "characterCell"
    
    // MARK: Object Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCellLayout()
        setupImageView()
        setupTitleLabel()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    // MARK: Setup Layout Methods
    
    private func setupCellLayout() {
        layer.cornerRadius = 5
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
