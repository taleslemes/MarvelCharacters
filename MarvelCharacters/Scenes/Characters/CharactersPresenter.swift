//
//  CharactersPresenter.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class CharactersPresenter {
    
    // MARK: Properties
    
    private let service: CharactersServiceInput
    weak var view: CharactersView?
    
    let title: String = "Characters"
    private var offset: Int = 0
    var isFetchingCharacters: Bool = false
    var model: [Character] = []
    
    // MARK: Object Lifecycle
    
    init(service: CharactersServiceInput) {
        self.service = service
        service.output = self
    }
    
    // MARK: Public Methods
    
    func viewDidLoad() {
        view?.showLoader()
        fetchCharacters()
    }
    
    func fetchCharacters() {
        service.fetchCharacters(offset: "\(offset)")
        isFetchingCharacters = true
        offset += 20
    }
        
}

// MARK: CharactersServiceOuput Interface Implementation

extension CharactersPresenter: CharactersServiceOutput {
    
    func fetchCharactersSucceeded(response: [Character]) {
        for character in response {
            self.model.append(character)
        }
        
        isFetchingCharacters = false
        view?.hideLoader()
        view?.reloadCollectionViewData()
    }
    
    func fetchCharactersFailed(error: Error) {
        isFetchingCharacters = false
        view?.hideLoader()
        view?.showError(message: error.localizedDescription)
    }
    
}
