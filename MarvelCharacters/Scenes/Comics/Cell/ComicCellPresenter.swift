//
//  ComicCellPresenter.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class ComicCellPresenter {
    
    // MARK: Properties
    
    private let model: ComicSummary
    private weak var view: ComicCellView?
    
    // MARK: Object Lifecycle
    
    init(model: ComicSummary) {
        self.model = model
    }
    
    // MARK: Public Methods
    
    func attachView(_ view: ComicCellView) {
        self.view = view
        
        view.setComicName(with: model.name ?? "")
    }
    
}
