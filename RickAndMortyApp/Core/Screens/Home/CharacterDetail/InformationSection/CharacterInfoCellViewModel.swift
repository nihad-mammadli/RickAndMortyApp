//
//  CharacterInfoCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 16.03.24.
//

import Foundation

final class CharacterInfoCellViewModel {
    public let data: String
    public let title: String
    
    init(data: String, title: String) {
        self.data = data
        self.title = title
    }
}
