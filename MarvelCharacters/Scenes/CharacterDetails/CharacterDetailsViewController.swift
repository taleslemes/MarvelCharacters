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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = true
        tableView.isUserInteractionEnabled = false
        tableView.register(ComicCell.self, forCellReuseIdentifier: ComicCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
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
        setupTableView()
        
        presenter.viewDidLoad()
    }
    
    // MARK: Setup Layout Methods
    
    private func createSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(characterDescriptionLabel)
        contentView.addSubview(tableView)
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
    
    private func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(greaterThanOrEqualTo: characterDescriptionLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
}

// MARK: UITableViewDataSource Interface Implementation

extension CharacterDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.model.comics.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ComicCell.identifier, for: indexPath) as? ComicCell else { return UITableViewCell() }
    
        let cellModel: ComicSummary = presenter.model.comics.items[indexPath.row]
        let cellPresenter = ComicCellPresenter(model: cellModel)
        cell.attachPresenter(cellPresenter)
        
        return cell
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
    
}
