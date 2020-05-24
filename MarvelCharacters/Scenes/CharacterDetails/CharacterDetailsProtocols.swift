//
//  CharacterDetailsProtocols.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol CharacterDetailsView: AnyObject {
    func setNavigationTitle(with text: String)
    func setCharacterName(with text: String)
    func setCharacterDescription(with text: String)
    func setImage(with imageUrl: String)
}

protocol CharacterDetailsRoutering: AnyObject {
    func navigateToComicsScene(comics: Comics)
}
