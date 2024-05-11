//
//  EpisodeDetailCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 23.03.24.
//

import Foundation

final class EpisodeDetailCellViewModel {
    public let data: String
    public let title: String
    
    init(data: String, title: String) {
        self.data = data
        self.title = title
    }
}
