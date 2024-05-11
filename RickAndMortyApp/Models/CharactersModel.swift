//
//  CharactersModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 06.03.24.
//

import Foundation

struct CharResult: Codable {
    let results: [CharactersModel]
}

struct CharactersModel: Codable, EpisodeCharacterDataRender {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: OriginModel
    let location: CharLocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    var _type: String {
        type ?? "unknown"
    }
}
