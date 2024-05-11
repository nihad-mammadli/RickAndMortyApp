//
//  LocationModel.swift
//  RickAndMortyApp
//
//  Created by Nebula on 06.03.24.
//

import Foundation

struct Locations: Codable {
    let results: [LocationModel]
}

struct LocationModel: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
