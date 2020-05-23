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
        let viewModel = CharactersViewModel()
        let viewController = CharactersViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
