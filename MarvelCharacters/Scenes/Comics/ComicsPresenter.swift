//
//  ComicsPresenter.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class ComicsPresenter {
    
    // MARK: Properties
    
    let model: Comics
    weak var view: CharacterDetailsView?
    
    let title: String = "Comics"
    
    // MARK: Object Lifecycle
    
    init(model: Comics) {
        self.model = model
    }
    
    // MARK: Public Methods
    
    
}

