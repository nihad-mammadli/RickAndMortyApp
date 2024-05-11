//
//  EpisodeDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 23.03.24.
//

import Foundation

protocol EpisodeDetailViewModelInterface {
    var view: EpisodeDetailScreenInterface? {get set}
    func viewDidLoad()
}

final class EpisodeDetailViewModel {
    weak var view: EpisodeDetailScreenInterface?
    
    enum episodeDetailsSectionType {
        case airDate
        case characters(viewModels: [EpisodeCharactersCellViewModel])
    }
    
    public var sections: [episodeDetailsSectionType] = []
    
    private func setupSections() {
        sections = [
            .airDate,
            .characters(viewModels: (view?.episode.characters.compactMap({
                return EpisodeCharactersCellViewModel(URL: $0)
            }))!)
        ]
    }
    
}

extension EpisodeDetailViewModel: EpisodeDetailViewModelInterface {
    func viewDidLoad() {
        view?.setupUI()
        view?.setupNavigationController()
        view?.setupCollectionView()
        setupSections()
    }
    
}
