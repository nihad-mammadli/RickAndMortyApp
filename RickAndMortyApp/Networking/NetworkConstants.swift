//
//  NetworkConstants.swift
//  RickAndMortyApp
//
//  Created by Nebula on 07.03.24.
//

import Foundation

enum APIURLs {
    static func list(endpoint: String, page: Int) -> String {
        "https://rickandmortyapi.com/api/\(endpoint)/?page=\(page)"
    }
    
    static func detail(endpoint: String, id: Int) -> String {
        "https://rickandmortyapi.com/api/\(endpoint)/\(id)"
    }
}
