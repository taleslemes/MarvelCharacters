//
//  Fixtures.swift
//  MarvelCharactersTests
//
//  Created by Tales Lemes on 25/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation
@testable import MarvelCharacters

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

// MARK: Thumbnail Extension

extension ThumbNail {
    static func fixture(path: String? = "",
                        imgExtension: String = ""
    ) -> ThumbNail {
        return ThumbNail(path: path, imgExtension: imgExtension)
    }
}


// MARK: CommicSummary Extension

extension ComicSummary {
    static func fixture(name: String? = "") -> ComicSummary {
        return ComicSummary(name: name)
    }
}
