//
//  CharactersViewController.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    // MARK: Properties
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width * 0.95, height: view.frame.height * 0.3)
        layout.minimumLineSpacing = 10
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.identifier)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    private let presenter: CharactersPresenter
    
    // MARK: Object Lifecycle
    
    init(presenter: CharactersPresenter) {
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
        setupCollectionView()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barTintColor = .marvelRed
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                                   .font: UIFont.Arial(withWeight: .bold, size: 28)]
        navigationItem.title = presenter.title
    }
    
    // MARK: Setup Layout Methods
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

// MARK: UICollectionViewDataSource Interface Implementation

extension CharactersViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell else { return UICollectionViewCell() }
        
        let cellModel: Character = presenter.model[indexPath.row]
        let cellPresenter = CharacterCellPresenter(model: cellModel)
        cell.attachPresenter(cellPresenter)
        
        return cell
    }
    
}

// MARK: UICollectionViewDelegate Interface Implementation

extension CharactersViewController: UICollectionViewDelegate {

}

// MARK: UIScrollViewDelegate Interface Implementation

extension CharactersViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        /// Here we check where the user is in the Y axis
        if offsetY / contentHeight > 0.7 && !presenter.isFetchingCharacters {
            getMoreCharactersFromServer()
        }
    }

    private func getMoreCharactersFromServer() {
        presenter.fetchCharacters()
    }
    
}

// MARK: CharactersView Interface Implementation

extension CharactersViewController: CharactersView {
    
    func showLoader() {
        Loader.show(in: self)
    }
    
    func hideLoader() {
        Loader.hide()
    }
    
    func showError(message: String) {
        showAlert(message: message)
    }
    
    func reloadCollectionViewData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}
