//
//  ComicCellDoubles.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation
@testable import MarvelCharacters

// MARK: ComicCellViewSpy

final class ComicCellViewSpy: ComicCellView {
    
    private(set) var setComicNameCalled = false
    private(set) var comicNameTextPassed: String?
    func setComicName(with text: String) {
        setComicNameCalled = true
        comicNameTextPassed = text
    }
    
}
