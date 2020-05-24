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
        
    }
    
}
