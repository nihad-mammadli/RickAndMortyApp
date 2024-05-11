//
//  CharacterDetailCell.swift
//  RickAndMortyApp
//
//  Created by Nebula on 16.03.24.
//

import UIKit

final class CharacterImageCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier: String = "imageCellIdentifier"
    
    // MARK: - UI Components
    private let characterImage: ImageView = {
        let iv = ImageView(frame: .zero)
        iv.contentMode = .scaleToFill
        iv.tintColor = .black
        return iv
    }()
    
    // MARK: - LifeCycle
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupCell()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    // MARK: - Setup UI
    func setupCell() {
        addSubview(characterImage)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: topAnchor),
            characterImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setCell(character: CharactersModel) {
        self.characterImage.downloadImage(character: character)
    }
    
}
