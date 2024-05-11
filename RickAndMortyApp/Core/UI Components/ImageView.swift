//
//  ImageView.swift
//  RickAndMortyApp
//
//  Created by Nebula on 14.03.24.
//

import UIKit

class ImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(character: CharactersModel) {
        guard let url = URL(string: character.image) else {return}
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
    
    func downloadURL(url: String) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
