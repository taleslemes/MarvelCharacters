//
//  APIResponse.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

struct APIResponse: Decodable {
    var data: DataStruct?
}

struct DataStruct: Decodable {
    var limit: Int?
    var results: [Character]?
}

