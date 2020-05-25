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
    private let router: CharacterDetailsRoutering
    weak var view: CharacterDetailsView?
    
    // MARK: Object Lifecycle
    
    init(model: Character, router: CharacterDetailsRoutering) {
        self.model = model
        self.router = router
    }
    
    // MARK: Public Methods
    
    func viewDidLoad() {
        view?.setNavigationTitle(with: model.name ?? "")
        view?.setCharacterName(with: model.name ?? "")
        shouldShowComicsButton()
        setCharacterDescription()
        setImageView()
    }
    
    func comicsButtonDidTap() {
        let comics = model.comics.items
        router.navigateToComicsScene(comics: comics)
    }
    
    // MARK: Private Methods
    
    private func setCharacterDescription() {
        let description = model.description == "" ? "There`s no description for this character yet." : model.description
        view?.setCharacterDescription(with: description ?? "There`s no description for this character yet.")
    }
    
    private func setImageView() {
        var imgUrl: String = ""
        
        if let path = model.thumbnail?.path, let imgExtension = model.thumbnail?.imgExtension {
            imgUrl = path + "." + imgExtension
        }
        
        view?.setImage(with: imgUrl)
    }
    
    private func shouldShowComicsButton() {
        let show = model.comics.items.count != 0
        view?.shouldShowComicsButton(show: show)
    }
    
}
