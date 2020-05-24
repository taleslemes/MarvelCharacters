//
//  CharactersRouter.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class CharactersRouter {
    
    func makeViewController() -> UIViewController {
        let service = CharactersService()
        let presenter = CharactersPresenter(service: service)
        let viewController = CharactersViewController(presenter: presenter)
        
        return viewController
    }
    
}
