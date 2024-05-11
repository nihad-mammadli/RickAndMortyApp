//
//  HomeScreenCell.swift
//  RickAndMortyApp
//
//  Created by Nebula on 04.03.24.
//

import UIKit

final class HomeScreenCell: UICollectionViewCell {    
    
    static let identifier: String = "cell"
    
    // MARK: - UI Components
    private let characterName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .natural
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let characterImage: ImageView = {
        let iv = ImageView(frame: .zero)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let characterStatus: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupCell() {
        self.addSubview(characterName)
        self.addSubview(characterStatus)
        self.addSubview(characterImage)
        self.layer.shadowColor = UIColor.label.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.cornerRadius = 5
        self.layer.shadowOffset = CGSize(width: -4, height: 4)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterStatus.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: topAnchor),
            characterImage.leftAnchor.constraint(equalTo: leftAnchor),
            characterImage.rightAnchor.constraint(equalTo: rightAnchor),
            
            characterName.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            characterName.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            characterName.bottomAnchor.constraint(equalTo: characterStatus.topAnchor, constant: -5),
            
            characterStatus.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            characterStatus.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            characterStatus.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            ])
        }
        
        func setHomeScreenCell(character: CharactersModel) {
            self.characterStatus.text = "Status: \(character.status)"
            self.characterName.text = character.name
            self.characterImage.downloadImage(character: character)
        }
    }

