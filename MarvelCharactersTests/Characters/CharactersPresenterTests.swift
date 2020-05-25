//
//  CharactersPresenterTests.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import XCTest
@testable import MarvelCharacters

final class CharactersPresenterTests: XCTestCase {

    private let view = CharactersViewSpy()
    private let service = CharactersServiceSpy()
    private let router = CharactersRouterSpy()
    private lazy var sut = CharactersPresenter(router: router, service: service)
    
    override func setUp() {
        sut.view = view
    }

    func test_viewDidLoad_shouldDelegateShowLoader() {
        sut.viewDidLoad()
        
        XCTAssertTrue(view.showLoaderCalled)
    }
    
    func test_viewDidLoad_shouldServiceFetchCharactersWithOffsetEqualZero() {
        sut.viewDidLoad()
        
        XCTAssertTrue(service.fetchCharactersCalled)
        XCTAssertEqual(service.offsetPassed, "0")
    }
    
    func test_fetchCharacters_givenServiceHasAlreadyFetchedCharactersBefore_shouldServiceFetchCharactersWithOffsetIncremented() {
        sut.fetchCharacters()
        sut.fetchCharacters()
        
        XCTAssertTrue(service.fetchCharactersCalled)
        XCTAssertEqual(service.offsetPassed, "20")
    }
    
    func test_didSelectItemAt_shouldRouterNavigateToCharacterDetailsScene() {
        sut.model = [Character.fixture(name: "Spider-Man"),
                     Character.fixture(name: "Hulk"),
                     Character.fixture(name: "Captain-America"),
                     Character.fixture(name: "Thor"),
                     Character.fixture(name: "Iron-Man"),
                     
        ]
        
        sut.didSelectItemAt(index: 3)
        
        XCTAssertTrue(router.navigateToCharactersDetailsSceneCalled)
        XCTAssertEqual(router.characterPassed, Character.fixture(name: "Thor"))
    }
    
    func test_fetchCharactersSucceeded_shouldDelegateHideLoader() {
        sut.fetchCharactersSucceeded(response: [Character.fixture()])
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func test_fetchCharactersSucceeded_shouldDelegateReloadCollectionViewData() {
        sut.fetchCharactersSucceeded(response: [Character.fixture()])
        
        XCTAssertTrue(view.reloadCollectionViewDataCalled)
    }
    
    func test_fetchCharactersFailed_shouldDelegateHideLoader() {
        sut.fetchCharactersFailed(error: AppError.generic)
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func test_fetchCharactersFailed_shouldDelegateShowErrorWithMessage() {
        sut.fetchCharactersFailed(error: AppError.generic)
        
        XCTAssertTrue(view.showErrorCalled)
        XCTAssertEqual(view.errorMessagePassed, "An unexpected problem has occurred. Try again later.")
    }
    
}
