//
//  ComicCell.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class ComicCell: UITableViewCell {
    
    // MARK: Properties
    
    private let comicNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.sizeToFit()
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .Arial(withWeight: .bold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    static let identifier = "comicCell"
    
    // MARK: Object Lifecycle
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
        createSubviews()
        setupComicNameLabel()
    }
    
    // MARK: Public Methods
    
    func attachPresenter(_ presenter: ComicCellPresenter) {
        presenter.attachView(self)
    }
    
    // MARK: Setup Layout Methods
    
    private func setupCell() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func createSubviews() {
        addSubview(comicNameLabel)
    }
    
    private func setupComicNameLabel() {
        NSLayoutConstraint.activate([
            comicNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            comicNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            comicNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            comicNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
}

// MARK: ComicCellView Interface Implementation

extension ComicCell: ComicCellView {
    
    func setComicName(with text: String) {
        comicNameLabel.text = text
    }
    
}
