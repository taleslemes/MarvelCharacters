//
//  CharactersDoubles.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation
@testable import MarvelCharacters

// MARK: CharactersViewSpy

final class CharactersViewSpy: CharactersView {
    
    private(set) var showLoaderCalled = false
    func showLoader() {
        showLoaderCalled = true
    }

    private(set) var hideLoaderCalled = false
    func hideLoader() {
        hideLoaderCalled = true
    }
    
    private(set) var showErrorCalled = false
    private(set) var errorMessagePassed: String?
    func showError(message: String) {
        showErrorCalled = true
        errorMessagePassed = message
    }
    
    private(set) var reloadCollectionViewDataCalled = false
    func reloadCollectionViewData() {
        reloadCollectionViewDataCalled = true
    }
        
}

// MARK: CharactersRouterSpy

final class CharactersRouterSpy: CharactersRoutering {
    
    private(set) var navigateToCharactersDetailsSceneCalled = false
    private(set) var characterPassed: Character?
    func navigateToCharacterDetailsScene(character: Character) {
        navigateToCharactersDetailsSceneCalled = true
        characterPassed = character
    }
    
}

// MARK: CharacterServiceSpy

final class CharactersServiceSpy: CharactersServiceInput {
    var output: CharactersServiceOutput?
    
    private(set) var fetchCharactersCalled = false
    private(set) var offsetPassed: String?
    func fetchCharacters(offset: String) {
        fetchCharactersCalled = true
        offsetPassed = offset
    }
    
}

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

// MARK: Thumbnail Extension

extension ThumbNail {
    static func fixture(path: String? = "",
                        imgExtension: String = ""
    ) -> ThumbNail {
        return ThumbNail(path: path, imgExtension: imgExtension)
    }
}

// MARK: Character Extension

extension Character {
    static func fixture(name: String? = "",
                        thumbnail: ThumbNail? = nil,
                        comics: Comics = Comics(items: []),
                        description: String? = ""
    ) -> Character {
        return Character(name: name, thumbnail: thumbnail, comics: comics, description: description)
    }
}
