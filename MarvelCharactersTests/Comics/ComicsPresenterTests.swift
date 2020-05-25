//
//  ComicsPresenterTests.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import XCTest
@testable import MarvelCharacters

final class ComicsPresenterTests: XCTestCase {
    
    func test_init() {
        let sut = ComicsPresenter(model: [ComicSummary.fixture(name: "Avengers #10")])
        XCTAssertEqual(sut.model, [ComicSummary(name: "Avengers #10")])
    }
    
}

