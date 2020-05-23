//
//  UIFont.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum ArialFontWeight {
        case bold
        case regular
        
        var systemFontWeight: UIFont.Weight {
            switch self {
            case .bold:
                return .bold
            case .regular:
                return .regular
            }
        }
    }
    
    static func Arial(withWeight weight: ArialFontWeight, size: CGFloat) -> UIFont {
        switch weight {
        case .bold:
            return UIFont(name: "Arial-Bold", size: size) ?? .systemFont(ofSize: size, weight: weight.systemFontWeight)
        case .regular:
            return UIFont(name: "Arial", size: size) ?? .systemFont(ofSize: size, weight: weight.systemFontWeight)
        }
    }
    
}
