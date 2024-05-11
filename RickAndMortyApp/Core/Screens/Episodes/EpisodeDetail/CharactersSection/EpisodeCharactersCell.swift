//
//  EpisodeCharactersCell.swift
//  RickAndMortyApp
//
//  Created by Nebula on 25.03.24.
//

import UIKit

final class EpisodeCharactersCell: UICollectionViewCell {
    //MARK: - Variables
    static let identifier: String = "episodeCharactersCell"

    //MARK: - UI Components
    private let characterImage: ImageView = {
        let iv = ImageView(frame: .zero)
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .white
        return iv
    }()
    
    private let characterInfoContainer: UIView = {
        let container = UIView()
        return container
    }()
    
    private let characterName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 32, weight: .regular)
        return label
    }()
    
    private let characterStatus: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tertiaryLabel
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

    //MARK: - Setup UI
extension EpisodeCharactersCell {
    func setCell(viewModel: EpisodeCharactersCellViewModel) {
        viewModel.registerForData { [weak self] data in
            self?.characterName.text = data.name
            self?.characterStatus.text = data.status
            self?.characterImage.downloadURL(url: data.image)
        }
        viewModel.fetchCharacters(url: viewModel.URL)
    }
    
    func setupUI() {
        addSubview(characterImage)
        addSubview(characterInfoContainer)
        characterInfoContainer.addSubview(characterName)
        characterInfoContainer.addSubview(characterStatus)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterStatus.translatesAutoresizingMaskIntoConstraints = false
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterInfoContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            characterImage.widthAnchor.constraint(equalTo: self.heightAnchor),
            characterImage.heightAnchor.constraint(equalTo: self.heightAnchor),
            characterImage.topAnchor.constraint(equalTo: self.topAnchor),
            characterImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            characterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            characterInfoContainer.topAnchor.constraint(equalTo: self.topAnchor),
            characterInfoContainer.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor),
            characterInfoContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            characterInfoContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            characterName.topAnchor.constraint(equalTo: characterInfoContainer.topAnchor, constant: 10),
            characterName.leadingAnchor.constraint(equalTo: characterInfoContainer.leadingAnchor, constant: 10),
            characterName.trailingAnchor.constraint(equalTo: characterInfoContainer.trailingAnchor, constant: -10),
            
            characterStatus.bottomAnchor.constraint(equalTo: characterInfoContainer.bottomAnchor, constant: -10),
            characterStatus.leadingAnchor.constraint(equalTo: characterInfoContainer.leadingAnchor, constant: 10),
            characterStatus.trailingAnchor.constraint(equalTo: characterInfoContainer.trailingAnchor, constant: -10)
        ])
    }
}
