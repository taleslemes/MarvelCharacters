//
//  AppError.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

enum AppError {
    case generic
}

extension AppError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .generic:
            return "An unexpected problem has occurred. Try again later."
        }
    }
    
}
