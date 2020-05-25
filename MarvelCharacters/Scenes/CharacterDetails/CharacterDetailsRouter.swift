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
    private weak var context: UIViewController?
    
    // MARK: Object Lifecycle
    
    init(character: Character, context: UIViewController) {
        self.character = character
        self.context = context
    }
    
    // MARK: Public Methods
    
    func makeViewController() -> UIViewController {
        let router = self
        let presenter = CharacterDetailsPresenter(model: character, router: router)
        let viewController = CharacterDetailsViewController(presenter: presenter)
        
        return viewController
    }
    
}

// MARK: CharacterDetailsRoutering Interface Implementation

extension CharacterDetailsRouter: CharacterDetailsRoutering {
    
    func navigateToComicsScene(comics: [ComicSummary]) {
        let router = ComicsRouter(comics: comics)
        context?.navigationController?.pushViewController(router.makeViewController(), animated: true)
    }
    
}
