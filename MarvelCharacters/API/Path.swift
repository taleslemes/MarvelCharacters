//
//  Path.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation
import CryptoSwift

enum Path {
    static let publicKey = "fa44b7fc714c385a5064d665bd843b02"
    static let privateKey = "a1a1592c20e6c1b6fc24d3e3970e617f1b3292a6"
    static let marvelBase = "gateway.marvel.com"
    static let charactersPath = "/v1/public/characters"
    static let ts = String(NSDate().timeIntervalSince1970.description)
    static let hash = (Path.ts + Path.privateKey + Path.publicKey).md5()
}
