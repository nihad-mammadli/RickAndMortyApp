//
//  LocationViewModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 22.03.24.
//

import Foundation

protocol LocationViewModelInterface {
    var view: LocationViewInterface? {get set}
    func viewDidLoad()
}

final class LocationViewModel {
    weak var view: LocationViewInterface?
    var locations: [LocationModel] = []
    var page = 1
}

extension LocationViewModel: LocationViewModelInterface {
    func viewDidLoad() {
        fetchLocations()
        view?.setupUI()
        view?.setupTableView()
    }
    
    func fetchLocations() {
        APICaller.getData(modelType: Locations.self, page: 1, endpoint: "location") { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let data):
                self.locations.append(contentsOf: data.results)
                DispatchQueue.main.async {
                    self.view?.locationsTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
