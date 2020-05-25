//
//  ComicCellPresenterTests.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//


import XCTest
@testable import MarvelCharacters

final class ComicCellPresenterTests: XCTestCase {

    private let view = ComicCellViewSpy()

    func test_attachView_givenNameIsNotNil_shouldDelegateSetComicName() {
        let sut = ComicCellPresenter(model: ComicSummary.fixture(name: "Hulk"))
        sut.attachView(view)
        
        XCTAssertTrue(view.setComicNameCalled)
        XCTAssertEqual(view.comicNameTextPassed, "Hulk")
    }
    
    func test_attachView_givenNameIsNil_shouldDelegateSetComicName() {
        let sut = ComicCellPresenter(model: ComicSummary.fixture(name: nil))
        sut.attachView(view)
        
        XCTAssertTrue(view.setComicNameCalled)
        XCTAssertEqual(view.comicNameTextPassed, "")
    }
    
}
