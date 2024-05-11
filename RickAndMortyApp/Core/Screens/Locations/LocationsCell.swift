//
//  LocationsCell.swift
//  RickAndMortyApp
//
//  Created by Nebula on 22.03.24.
//

import UIKit

class LocationsCell: UITableViewCell {
    
    //MARK: - Variables
    static let identifier: String = "cell"
    
    //MARK: - UI Components
    private let name: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .regular)
        label.text = "Title"
        label.numberOfLines = 0
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    //MARK: - Setup UI
    private func setupUI() {
        addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            name.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setCell(name: String) {
        self.name.text = name
    }
}
