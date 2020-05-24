//
//  CharacterCellProtocols.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol CharacterCellView: AnyObject {
    func setTitle(with text: String)
    func setImage(with imageUrl: String)
}
