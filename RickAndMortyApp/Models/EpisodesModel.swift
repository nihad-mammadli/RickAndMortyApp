//
//  EpisodesModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 06.03.24.
//

import Foundation

struct Episodes: Codable {
    var results: [EpisodesModel]
}

struct EpisodesModel: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
