//
//  TabBarController.swift
//  RickAndMortyApp
//
//  Created by Nebula on 07.03.24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        self.tabBar.barTintColor = .systemBackground
    }
    
    private func setupTabs() {
        let home = self.createNav(title: "Characters", image: UIImage(systemName: "person.fill"), vc: HomeView())
        let episodes = self.createNav(title: "Episodes", image: UIImage(systemName: "film.stack.fill"), vc: EpisodesView())
        let locations = self.createNav(title: "Locations", image: UIImage(systemName: "location.fill"), vc: LocationsView())
        let about = self.createNav(title: "About", image: UIImage(systemName: "info.circle.fill"), vc: About())
        
        self.setViewControllers([home,episodes,locations,about], animated: true)
    }
    
    private func createNav(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        nav.navigationBar.prefersLargeTitles = true
        return nav
    }
    
}
