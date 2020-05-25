//
//  CharacterCellPresenterTests.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import XCTest
@testable import MarvelCharacters

final class CharacterCellPresenterTests: XCTestCase {

    private let view = CharacterCellViewSpy()

    func test_attachView_givenNameIsNotNil_shouldDelegateSetTitle() {
        let sut = CharacterCellPresenter(model: Character.fixture(name: "Spider-Man"))
        sut.attachView(view)
        
        XCTAssertTrue(view.setTitleCalled)
        XCTAssertEqual(view.titleTextPassed, "Spider-Man")
    }
    
    func test_attachView_givenNameIsNil_shouldDelegateSetTitle() {
           let sut = CharacterCellPresenter(model: Character.fixture(name: nil))
           sut.attachView(view)
           
           XCTAssertTrue(view.setTitleCalled)
           XCTAssertEqual(view.titleTextPassed, "")
       }
    
    func test_attachView_givenThumbnailIsNotNil_shouldDelegateSetImage() {
        let sut = CharacterCellPresenter(model: Character.fixture(thumbnail: ThumbNail.fixture(path: "http://www.characterImagePath.com/hulk",
                                                                                               imgExtension: "jpg")))
        sut.attachView(view)
        
        XCTAssertTrue(view.setImageCalled)
        XCTAssertEqual(view.imageUrlPassed, "http://www.characterImagePath.com/hulk.jpg")
    }
    
    func test_attachView_givenThumbnailIsNil_shouldDelegateSetImage() {
           let sut = CharacterCellPresenter(model: Character.fixture(thumbnail: nil))
           sut.attachView(view)
           
           XCTAssertTrue(view.setImageCalled)
           XCTAssertEqual(view.imageUrlPassed, "")
       }
    
}
