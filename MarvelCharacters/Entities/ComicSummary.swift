//
//  ComicSummary.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

struct ComicSummary: Decodable {
    var name: String?
}

extension ComicSummary: Equatable {
    static func == (lhs: ComicSummary, rhs: ComicSummary) -> Bool {
        return lhs.name == rhs.name
    }
}
