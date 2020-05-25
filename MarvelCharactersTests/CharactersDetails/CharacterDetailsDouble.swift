//
//  CharacterDetailsDouble.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation
@testable import MarvelCharacters

// MARK: CharacterDetailsRouterSpy

final class CharacterDetailsRouterSpy: CharacterDetailsRoutering {
    
    private(set) var navigateToComicsSceneCalled = false
    private(set) var comicsPassed: [ComicSummary]?
    func navigateToComicsScene(comics: [ComicSummary]) {
        navigateToComicsSceneCalled = true
        comicsPassed = comics
    }
    
}

// MARK: CharacterDetailsViewSpy

final class CharacterDetailsViewSpy: CharacterDetailsView {
    
    private(set) var setNavigationTitleCalled = false
    private(set) var navigationTitleTextPassed: String?
    func setNavigationTitle(with text: String) {
        setNavigationTitleCalled = true
        navigationTitleTextPassed = text
    }
    
    private(set) var setCharacterNameCalled = false
    private(set) var characterNameTextPassed: String?
    func setCharacterName(with text: String) {
        setCharacterNameCalled = true
        characterNameTextPassed = text
    }
    
    private(set) var setCharacterDescriptionCalled = false
    private(set) var characterDescriptionTextPassed: String?
    func setCharacterDescription(with text: String) {
        setCharacterDescriptionCalled = true
        characterDescriptionTextPassed = text
    }
    
    private(set) var setImageCalled = false
    private(set) var imageUrlPassed: String?
    func setImage(with imageUrl: String) {
        setImageCalled = true
        imageUrlPassed = imageUrl
    }
    
    private(set) var shouldShowComicsButtonCalled = false
    private(set) var showPassed: Bool?
    func shouldShowComicsButton(show: Bool) {
        shouldShowComicsButtonCalled = true
        showPassed = show
    }
    
}
