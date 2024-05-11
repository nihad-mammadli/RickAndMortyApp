//
//  EpisodeInfoCell.swift
//  RickAndMortyApp
//
//  Created by Nebula on 25.03.24.
//

import UIKit

final class EpisodeInfoCell: UICollectionViewCell {
    //MARK: - Variables
    static let identifier: String = "infoCell"
    
    //MARK: - UI Components
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .regular)
        label.text = "Air Date"
        return label
    }()
    
    private let data: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.numberOfLines = 0
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
extension EpisodeInfoCell {
    private func setupUI() {
        addSubview(title)
        addSubview(data)
        title.translatesAutoresizingMaskIntoConstraints = false
        data.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            data.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            data.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setCell(episode: EpisodesModel) {
        data.text = episode.air_date
    }
}
