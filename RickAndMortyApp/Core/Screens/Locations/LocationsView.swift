//
//  LocationsView.swift
//  RickAndMortyApp
//
//  Created by Nebula on 07.03.24.
//

import UIKit

protocol LocationViewInterface: AnyObject {
    func setupUI()
    func setupTableView()
    var locationsTableView: UITableView {get}
}


final class LocationsView: UIViewController {

    //MARK: - Variables
    private lazy var LocationVM = LocationViewModel()
    
    //MARK: - UI Components
    var locationsTableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationVM.view = self
        LocationVM.viewDidLoad()
        self.view.backgroundColor = .systemBackground
    }
}

    //MARK: - TableView Settings
extension LocationsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocationVM.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationsTableView.dequeueReusableCell(withIdentifier: LocationsCell.identifier, for: indexPath) as! LocationsCell
        cell.setCell(name: LocationVM.locations[indexPath.item].name)
        return cell
    }
    
}

    //MARK: - Setup UI
extension LocationsView: LocationViewInterface {
    func setupUI() {
        self.view?.addSubview(locationsTableView)
        locationsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationsTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            locationsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            locationsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            locationsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func setupTableView() {
        locationsTableView.register(LocationsCell.self, forCellReuseIdentifier: LocationsCell.identifier)
        locationsTableView.rowHeight = 75
        locationsTableView.dataSource = self
        locationsTableView.delegate = self
    }
}
