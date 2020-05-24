//
//  Character.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

struct Character: Decodable {
    var name: String?
    var thumbnail : ThumbNail?
    var comics: Comics
    var description : String?
}

struct ThumbNail: Decodable {
    var path: String?
    var imgExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case imgExtension = "extension"
    }
}

struct Comics: Decodable {
    var items: [ComicSummary]
}

struct ComicSummary: Decodable {
    var name: String?
}
