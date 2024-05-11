//
//  EpisodesViewModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 12.03.24.
//

import UIKit

protocol EpisodesViewModelInterface {
    var view: EpisodesInterface? {get set}
    func viewDidLoad()
    func viewDidAppear()
}

final class EpisodesViewModel {
    weak var view: EpisodesInterface?
    var episodes: [EpisodesModel] = []
    var page = 1
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offset >= contentHeight - (1.3 * height) {
            fetchEpisodes()
        }
    }
    
    func fetchEpisodes() {
        APICaller.getData(modelType: Episodes.self, page: page, endpoint: "episode") { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let data):
                self.episodes.append(contentsOf: data.results)
                DispatchQueue.main.async {
                    self.view?.episodesCollectionView.reloadData()
                }
                page += 1
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchDetail(id: Int) {
        APICaller.getDetails(modelType: EpisodesModel.self, id: id, endpoint: "episode") { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let data):
                view?.navigateToDetails(episode: data)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension EpisodesViewModel: EpisodesViewModelInterface {
    func viewDidLoad() {
        fetchEpisodes()
    }
    
    func viewDidAppear() {
        view?.setupUI()
        view?.setUpCollectionView()
    }
}
