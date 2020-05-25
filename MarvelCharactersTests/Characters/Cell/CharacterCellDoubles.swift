//
//  CharacterCellDoubles.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation
@testable import MarvelCharacters

// MARK: CharacterCellViewSpy

final class CharacterCellViewSpy: CharacterCellView {
    
    private(set) var setTitleCalled = false
    private(set) var titleTextPassed: String?
    func setTitle(with text: String) {
        setTitleCalled = true
        titleTextPassed = text
    }
    
    private(set) var setImageCalled = false
    private(set) var imageUrlPassed: String?
    func setImage(with imageUrl: String) {
        setImageCalled = true
        imageUrlPassed = imageUrl
    }
    
}
