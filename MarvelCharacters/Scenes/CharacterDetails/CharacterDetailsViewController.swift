//
//  CharacterDetailsViewController.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class CharacterDetailsViewController: UIViewController {
    
    // MARK: Properties
    
    private let presenter: CharacterDetailsPresenter
    
    // MARK: Object Lifecycle
    
    init(presenter: CharacterDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
}
