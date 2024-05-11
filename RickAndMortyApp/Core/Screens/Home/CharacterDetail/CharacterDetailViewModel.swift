//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 14.03.24.
//

import Foundation

protocol CharactersDetailViewModelInterface {
    var view: CharacterDetailInterface? {get set}
    func viewDidLoad()
}

final class CharacterDetailViewModel {
    weak var view: CharacterDetailInterface?
    
    enum characterDetailsSectionType {
        case photo
        case information(viewModels: [CharacterInfoCellViewModel])
    }

    public var sections: [characterDetailsSectionType] = []

    private func setUpSections() {
        sections = [
            .photo,
            .information(viewModels: [
                .init(data: view?.character.status ?? "unknown", title: "Status"),
                .init(data: view?.character.gender ?? "unknown", title: "Gender"),
                .init(data: view?.character.type ?? "unknown", title: "Type"),
                .init(data: view?.character.species ?? "unknown", title: "Species"),
                .init(data: view?.character.origin.name ?? "unknown", title: "Origin"),
                .init(data: view?.character.location.name ?? "unknown", title: "Location")
            ])
        ]
    }
}

extension CharacterDetailViewModel: CharactersDetailViewModelInterface {
    
    func viewDidLoad() {
        view?.setupUI()
        view?.setupCollectionView()
        view?.setupNavigationController()
        setUpSections()
    }
}
