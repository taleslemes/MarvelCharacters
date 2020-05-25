//
//  CharacterDetailsPresenterTests.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import XCTest
@testable import MarvelCharacters

final class CharacterDetailsPresenterTests: XCTestCase {
    
    private let view = CharacterDetailsViewSpy()
    private let router = CharacterDetailsRouterSpy()
    
    func test_viewDidLoad_givenNameIsNotNil_shouldDelegateSetNavigationTitle() {
        let model = Character.fixture(name: "Iron-Man")
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.setNavigationTitleCalled)
        XCTAssertEqual(view.navigationTitleTextPassed, "Iron-Man")
    }
    
    func test_viewDidLoad_givenNameIsNil_shouldDelegateSetNavigationTitle() {
        let model = Character.fixture(name: nil)
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.setNavigationTitleCalled)
        XCTAssertEqual(view.navigationTitleTextPassed, "")
    }
    
    func test_viewDidLoad_givenNameIsNotNil_shouldDelegateSetCharacterName() {
        let model = Character.fixture(name: "Iron-Man")
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.setCharacterNameCalled)
        XCTAssertEqual(view.characterNameTextPassed, "Iron-Man")
    }
    
    func test_viewDidLoad_givenNameIsNil_shouldDelegateSetCharacterName() {
        let model = Character.fixture(name: nil)
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.setCharacterNameCalled)
        XCTAssertEqual(view.characterNameTextPassed, "")
    }
    
    func test_viewDidLoad_givenComicsCountAreGreaterThanZero_shouldDelegateShouldShowComicsButton() {
        let model = Character.fixture(comics: Comics(items: [ComicSummary.fixture()]))
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.shouldShowComicsButtonCalled)
        XCTAssertEqual(view.showPassed, true)
    }
    
    func test_viewDidLoad_givenComicsCountAreEqualZero_shouldDelegateShouldNotShowComicsButton() {
        let model = Character.fixture(comics: Comics(items: []))
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.shouldShowComicsButtonCalled)
        XCTAssertEqual(view.showPassed, false)
    }
    
    func test_viewDidLoad_givenDescriptionIsNotEmpty_shouldDelegateSetCharacterDescription() {
        let model = Character.fixture(description: "Tony Stark is Iron-Man. He is genius, billionaire, playboy and philanthropist.")
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.setCharacterDescriptionCalled)
        XCTAssertEqual(view.characterDescriptionTextPassed, "Tony Stark is Iron-Man. He is genius, billionaire, playboy and philanthropist.")
    }
    
    func test_viewDidLoad_givenDescriptionIsEmpty_shouldDelegateSetCharacterDescription() {
        let model = Character.fixture(description: "")
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.setCharacterDescriptionCalled)
        XCTAssertEqual(view.characterDescriptionTextPassed, "There`s no description for this character yet.")
    }
    
    func test_viewDidLoad_givenDescriptionIsNil_shouldDelegateSetCharacterDescription() {
        let model = Character.fixture(description: nil)
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.setCharacterDescriptionCalled)
        XCTAssertEqual(view.characterDescriptionTextPassed, "There`s no description for this character yet.")
    }
    
    
    func test_viewDidLoad_givenThumbnailIsNotNil_shouldDelegateSetCharacterImage() {
        let model = Character.fixture(thumbnail: ThumbNail.fixture(path: "http//www.ironmanpath.com/image", imgExtension: "jpg"))
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.setImageCalled)
        XCTAssertEqual(view.imageUrlPassed, "http//www.ironmanpath.com/image.jpg")
    }
    
    func test_viewDidLoad_givenThumbnailIsNil_shouldDelegateSetCharacterImage() {
        let model = Character.fixture(thumbnail: nil)
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.viewDidLoad()
        
        XCTAssertTrue(view.setImageCalled)
        XCTAssertEqual(view.imageUrlPassed, "")
    }
    
    func test_comicsButtonDidTap_shouldRouterNavigateToComicsScene() {
        let model = Character.fixture(comics: Comics(items: [ComicSummary.fixture(name: "Avengers #1"),
                                                             ComicSummary.fixture(name: "Avengers #2")]))
        let sut = CharacterDetailsPresenter(model: model, router: router)
        sut.view = view
        sut.comicsButtonDidTap()
        
        XCTAssertTrue(router.navigateToComicsSceneCalled)
        XCTAssertEqual(router.comicsPassed, [ComicSummary(name: "Avengers #1"),
                                             ComicSummary(name: "Avengers #2")])
    }
    
}
