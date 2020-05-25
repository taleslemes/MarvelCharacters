//
//  ComicsViewController.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class ComicsViewController: CustomViewController {
    
    // MARK: Properties
    
    private lazy var tableView: UITableView = {
          let tableView = UITableView()
          tableView.dataSource = self
//          tableView.delegate = self
          tableView.isScrollEnabled = true
          tableView.isUserInteractionEnabled = true
          tableView.register(ComicCell.self, forCellReuseIdentifier: ComicCell.identifier)
          tableView.rowHeight = UITableView.automaticDimension
          tableView.estimatedRowHeight = 180
          tableView.separatorStyle = .none
          tableView.translatesAutoresizingMaskIntoConstraints = false
          
          return tableView
      }()
    
    private let presenter: ComicsPresenter
    
    // MARK: Object Lifecycle
    
    init(presenter: ComicsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    // MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createSubviews()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationController()
    }
    
    // MARK: Setup Layout Methods
    
    private func setupNavigationController() {
        navigationTitleLabel.text = presenter.title
    }

    private func createSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

// MARK: UITableViewDataSource Interface Implementation

extension ComicsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ComicCell.identifier, for: indexPath) as? ComicCell else { return UITableViewCell() }
        
        let cellModel: ComicSummary = presenter.model[indexPath.row]
        let cellPresenter = ComicCellPresenter(model: cellModel)
        cell.attachPresenter(cellPresenter)
        
        return cell
    }
    
}
