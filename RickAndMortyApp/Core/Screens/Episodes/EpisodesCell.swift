//
//  EpisodesCell.swift
//  RickAndMortyApp
//
//  Created by Nebula on 18.03.24.
//

import UIKit

final class EpisodesCell: UICollectionViewCell {
    //MARK: - Variables
    static let identifier: String = "cell"
    
    //MARK: - UI Components
    private let episodeName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    let nameContainer: UIView = {
        let container = UIView()
        return container
    }()
    
    private let episodeNumber: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        addSubview(nameContainer)
        nameContainer.addSubview(episodeName)
        addSubview(episodeNumber)
        backgroundColor = .tertiaryLabel
        layer.cornerRadius = 8
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        episodeName.translatesAutoresizingMaskIntoConstraints = false
        nameContainer.translatesAutoresizingMaskIntoConstraints = false
        episodeNumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            episodeNumber.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            episodeNumber.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            nameContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            nameContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            nameContainer.topAnchor.constraint(equalTo: self.topAnchor),
            nameContainer.widthAnchor.constraint(equalToConstant: 275),
            
            episodeName.leadingAnchor.constraint(equalTo: nameContainer.leadingAnchor, constant: 10),
            episodeName.trailingAnchor.constraint(equalTo: nameContainer.trailingAnchor, constant: -10),
            episodeName.topAnchor.constraint(equalTo: nameContainer.topAnchor, constant: 5),
            episodeName.bottomAnchor.constraint(equalTo: nameContainer.bottomAnchor, constant: -5),
        ])
    }
    
    func setCell(episode: EpisodesModel) {
        episodeName.text = episode.name
        episodeNumber.text = episode.episode
    }
    
}
