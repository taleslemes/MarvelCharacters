//
//  CharacterDetailsPresenter.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class CharacterDetailsPresenter {
    
    // MARK: Properties
    
    let model: Character
    weak var view: CharacterDetailsView?
    
    // MARK: Object Lifecycle
    
    init(model: Character) {
        self.model = model
    }
    
    // MARK: Public Methods
    
    func viewDidLoad() {
        view?.setNavigationTitle(with: model.name ?? "")
        view?.setCharacterName(with: model.name ?? "")
        setCharacterDescription()
        setImageView()
    }
    
    // MARK: Private Methods
    
    func setCharacterDescription() {
        let description = model.description?.isEmpty ?? true ? "There`s no description for this character yet." : model.description ?? ""
        view?.setCharacterDescription(with: "Description: \(description)")
    }
    
    func setImageView() {
        var imgUrl: String = ""
        
        if let path = model.thumbnail?.path, let imgExtension = model.thumbnail?.imgExtension {
            imgUrl = path + "." + imgExtension
        }
        
        view?.setImage(with: imgUrl)
    }
    
}
