//
//  About.swift
//  RickAndMortyApp
//
//  Created by Nebula on 07.03.24.
//

import UIKit

final class About: UIViewController {

    //MARK: - Variables
    private let settings = ["Rate App", "Contact Us", "About", "Terms and policies"]
    
    //MARK: - UI Components
    private let tableView: UITableView = {
       let tv = UITableView()
        return tv
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupUI()
        setupTableView()
    }
    
    //MARK: - Setup UI
    private func setupUI() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.identifier)
        tableView.rowHeight = 50
    }

}

    //MARK: - TableView Settings
extension About: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.identifier, for: indexPath) as! AboutCell
        cell.setLabel(text: settings[indexPath.row])
        return cell
    }
    
}
