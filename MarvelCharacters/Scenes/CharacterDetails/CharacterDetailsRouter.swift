//
//  CharacterDetailsRouter.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class CharacterDetailsRouter {
    
    // MARK: Properties
    
    private let character: Character
    
    // MARK: Object Lifecycle
    
    init(character: Character) {
        self.character = character
    }
    
    // MARK: Public Methods
    
    func makeViewController() -> UIViewController {
        let presenter = CharacterDetailsPresenter(model: character)
        let viewController = CharacterDetailsViewController(presenter: presenter)
        
        return viewController
    }
    
}
