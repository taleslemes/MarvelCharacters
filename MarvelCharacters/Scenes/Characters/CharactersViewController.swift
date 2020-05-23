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
    
    private let viewModel: CharactersViewModel
    
    // MARK: Object Lifecycle
    
    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    // MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
