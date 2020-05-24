//
//  CharacterCellPresenter.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class CharacterCellPresenter {
    
    // MARK: Properties
    
    private let model: Character
    private weak var view: CharacterCellView?
    
    // MARK: Object Lifecycle
    
    init(model: Character) {
        self.model = model
    }
    
    // MARK: Public Methods
    
    func attachView(_ view: CharacterCellView) {
        self.view = view
        
        view.setTitle(with: model.name ?? "")
        setImageView()
    }
    
    // MARK: Private Methods
    
    private func setImageView() {
        var imgUrl: String = ""
        
        if let path = model.thumbnail?.path, let imgExtension = model.thumbnail?.imgExtension {
           imgUrl = path + "." + imgExtension
        }
        
        view?.setImage(with: imgUrl)
    }
    
}
