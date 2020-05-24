//
//  CharactersViewModel.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class CharactersViewModel {
    
    // MARK: Properties
    
    private let service: CharactersServiceInput
    
    let title: String = "Characters"
    var offset: Int = 0
    
    // MARK: Object Lifecycle
    
    init(service: CharactersServiceInput) {
        self.service = service
        service.output = self
    }
    
    // MARK: Public Methods
    
    func viewDidLoad() {
        fetchCharacters(offset: offset)
    }
    
    func fetchCharacters(offset: Int) {
        service.fetchCharacters(offset: "\(offset)")
    }
        
}

// MARK: CharactersServiceOuput Interface Implementation

extension CharactersViewModel: CharactersServiceOutput {
    
    func fetchCharactersSucceeded(response: APIResponse) {
        
    }
    
    func fetchCharactersFailed(error: Error) {
        
    }
    
}
