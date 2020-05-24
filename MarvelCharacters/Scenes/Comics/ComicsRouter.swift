//
//  ComicsRouter.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class ComicsRouter {
    
    // MARK: Properties
    
    private let comics: Comics
    
    // MARK: Object Lifecycle
    
    init(comics: Comics) {
        self.comics = comics
    }
    
    // MARK: Public Methods
    
    func makeViewController() -> UIViewController {
        let presenter = ComicsPresenter(model: comics)
        let viewController = ComicsViewController(presenter: presenter)
        
        return viewController
    }
    
}
