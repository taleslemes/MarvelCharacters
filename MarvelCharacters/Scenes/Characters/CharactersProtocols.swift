//
//  CharactersProtocols.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol CharactersView: AnyObject {
    func showLoader()
    func hideLoader()
    func showError(message: String)
    func reloadCollectionViewData()
}

protocol CharactersServiceInput: AnyObject {
    var output: CharactersServiceOutput? { get set }
    func fetchCharacters(offset: String)
}

protocol CharactersServiceOutput: AnyObject {
    func fetchCharactersSucceeded(response: [Character])
    func fetchCharactersFailed(error: Error)
}

protocol CharactersRoutering: AnyObject {
    func navigateToCharacterDetailsScene(character: Character)
}
