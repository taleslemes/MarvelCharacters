//
//  CharactersService.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class CharactersService: CharactersServiceInput {
    
    // MARK: Properties
    
    weak var output: CharactersServiceOutput?
    private let api: APIProvider
    
    // MARK: Object Lifecycle
    
    init(api: APIProvider = APICore()) {
        self.api = api
    }
    
    // MARK: CharactersServiceInput Interface Implementation
    
    func fetchCharacters(offset: String) {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = Path.marvelBase
        components.path = Path.charactersPath
        components.queryItems = [
            URLQueryItem(name: "apikey", value: Path.publicKey),
            URLQueryItem(name: "ts", value: Path.ts),
            URLQueryItem(name: "hash", value: Path.hash),
            URLQueryItem(name: "limit", value: "20"),
            URLQueryItem(name: "offset", value: offset),
        ]
        
        guard let url = components.url else { return }
        
        api.request(url: url) { [output] (response: Result<APIResponse, Error>) in
            switch response {
            case .success(let response):
                output?.fetchCharactersSucceeded(response: response.data?.results ?? [])
            case .failure(let error):
                output?.fetchCharactersFailed(error: error)
            }
        }
        
    }

}
