//
//  CharactersRouter.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class CharactersRouter {
    
    // MARK: Properties
    
    private weak var context: UIViewController?
    
    // MARK: Public Methods
    
    func makeViewController() -> UIViewController {
        let router = self
        let service = CharactersService()
        let presenter = CharactersPresenter(router: router, service: service)
        let viewController = CharactersViewController(presenter: presenter)
        
        context = viewController
        
        return viewController
    }
    
}

// MARK: CharactersRoutering Interface Implementation

extension CharactersRouter: CharactersRoutering {
    
    func navigateToCharacterDetailsScene(character: Character) {
        let router = CharacterDetailsRouter(character: character)
        context?.navigationController?.pushViewController(router.makeViewController(), animated: true)
    }
    
}

