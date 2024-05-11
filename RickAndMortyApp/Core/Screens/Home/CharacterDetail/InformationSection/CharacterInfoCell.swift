//
//  CharacterInfoCell.swift
//  RickAndMortyApp
//
//  Created by Nebula on 16.03.24.
//

import UIKit

final class CharacterInfoCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier: String = "infoCellIdentifier"
    
    // MARK: - UI Components
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let data: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let titleContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .tertiaryLabel
        container.layer.cornerRadius = 8
        return container
    }()
    
    private let dataContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .tertiarySystemFill
        container.layer.cornerRadius = 8
        return container
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .tertiarySystemFill
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    func setupUI() {
        addSubview(titleContainer)
        titleContainer.addSubview(title)
        addSubview(dataContainer)
        dataContainer.addSubview(data)

        dataContainer.translatesAutoresizingMaskIntoConstraints = false
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        data.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleContainer.topAnchor.constraint(equalTo: self.topAnchor),
            titleContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.33),
            
            dataContainer.topAnchor.constraint(equalTo: titleContainer.bottomAnchor),
            dataContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dataContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dataContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            title.topAnchor.constraint(equalTo: titleContainer.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor, constant: -10),

            data.topAnchor.constraint(equalTo: dataContainer.topAnchor, constant: 5),
            data.leadingAnchor.constraint(equalTo: dataContainer.leadingAnchor, constant: 10),
            data.trailingAnchor.constraint(equalTo: dataContainer.trailingAnchor, constant: -10),
            data.bottomAnchor.constraint(equalTo: dataContainer.bottomAnchor, constant: -5)
        ])
    }
    
    func setCell(with viewModel: CharacterInfoCellViewModel) {
        self.title.text = viewModel.title
        self.data.text = viewModel.data
    }
    
}
