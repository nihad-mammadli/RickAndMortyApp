//
//  EpisodeCharactersCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 25.03.24.
//

import Foundation

protocol EpisodeCharacterDataRender {
    var name: String {get}
    var image: String {get}
    var status: String {get}
}

final class EpisodeCharactersCellViewModel {
    private var isFetching = false
    private var dataBlock: ((EpisodeCharacterDataRender) -> Void)?
    private var character: CharactersModel? {
        didSet {
            guard let data = character else { return }
            self.dataBlock?(data)
        }
    }
    public let URL: String
    
    init(URL: String) {
        self.URL = URL
    }
    
    public func registerForData(_ block: @escaping (EpisodeCharacterDataRender) -> Void) {
        self.dataBlock = block
    }
    
    public func fetchCharacters(url: String) {
        guard !isFetching else {
            if let model = character {
                self.dataBlock?(model)
            }
            return
        }
        APICaller.fetchDataWithUrl(modelType: CharactersModel.self, url: URL) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.character = data
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

