//
//  HomeViewModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 08.03.24.
//

import UIKit

protocol HomeViewModelInterface {
    var view: HomeInterface? {get set}
    func viewDidLoad()
    func viewDidAppear()
}

final class HomeViewModel {
    weak var view: HomeInterface?
    var characters: [CharactersModel] = []
    var page = 1
    let pageCount = 46
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        fetchCharacters()
    }
    
    func viewDidAppear() {
        view?.setupUI()
        view?.setupNavigationItem()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offset >= contentHeight - (1.3 * height) {
            fetchCharacters()
        }
    }
    
    func fetchCharacters() {
        APICaller.getData(modelType: CharResult.self, page: page, endpoint: "character") { [weak self] result in
            guard let self = self else {return}
                    
            switch result {
            case .success(let data):
                self.characters.append(contentsOf: data.results)
                DispatchQueue.main.async {
                    self.view?.collectionView.reloadData()
                }
                if page < pageCount {
                    page += 1
                } else { return }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchDetail(id: Int) {
        APICaller.getDetails(modelType: CharactersModel.self, id: id, endpoint: "character") { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let data):
                view?.navigateToDetails(character: data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
