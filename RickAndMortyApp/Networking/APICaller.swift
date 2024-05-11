//
//  APICaller.swift
//  RickAndMortyApp
//
//  Created by Nebula on 07.03.24.
//

import Foundation

public class APICaller {
    
    //MARK: - API call for data
    static func getData<T: Codable>(
        modelType: T.Type,
        page: Int,
        endpoint: String,
        completionHandler: @escaping (_ result: Result<T,NetworkErrors>) -> Void) {
            let urlString = APIURLs.list(endpoint: endpoint, page: page)
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
                guard let urlResponse = urlResponse as? HTTPURLResponse, urlResponse.statusCode >= 200, urlResponse.statusCode <= 299 else {
                    return
                }
                if let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(modelType, from: data) {
                    completionHandler(.success(resultData))
                } else {
                    completionHandler(.failure(.parsingError))
                }
                
            }.resume()
        }
    
    //MARK: - API Call for details
    static func getDetails<T: Codable>(
        modelType: T.Type,
        id: Int,
        endpoint: String,
        completionHandler: @escaping (_ result: Result <T,NetworkErrors>) -> Void ) {
            let urlString = APIURLs.detail(endpoint: endpoint, id: id)
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
                guard let urlResponse = urlResponse as? HTTPURLResponse, urlResponse.statusCode >= 200, urlResponse.statusCode <= 299 else {return}
                
                if let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(modelType, from: data) {
                    completionHandler(.success(resultData))
                } else {
                    completionHandler(.failure(.parsingError))
                }
            }.resume()
        }
    
    //MARK: - API Call with URL
    static func fetchDataWithUrl<T: Codable>(
        modelType: T.Type,
        url: String,
        completionHandler: @escaping (_ result: Result <T,NetworkErrors>) -> Void ) {
            guard let url = URL(string: url) else {
                completionHandler(.failure(.parsingError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
                guard let urlResponse = urlResponse as? HTTPURLResponse, urlResponse.statusCode >= 200, urlResponse.statusCode <= 299 else {return}
                
                if let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(modelType, from: data) {
                    completionHandler(.success(resultData))
                } else {
                    completionHandler(.failure(.parsingError))
                }
            }.resume()
        }
}
