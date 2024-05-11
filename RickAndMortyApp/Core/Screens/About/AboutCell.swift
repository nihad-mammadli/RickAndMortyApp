//
//  AboutCellTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Nebula on 11.05.24.
//

import UIKit

class AboutCell: UITableViewCell {

    //MARK: - Variables
    static let identifier: String = "cell"
    
    //MARK: - UI Components
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
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
    func setupUI() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    func setLabel(text: String) {
        self.label.text = text
    }
}
