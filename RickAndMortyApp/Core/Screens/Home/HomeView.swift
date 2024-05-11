//
//  HomeView.swift
//  RickAndMortyApp
//
//  Created by Nebula on 04.03.24.
//

import UIKit

protocol HomeInterface: AnyObject {
    func setupNavigationItem()
    func setupUI()
    func navigateToDetails(character: CharactersModel)
    var collectionView: UICollectionView {get}
}

final class HomeView: UIViewController {

    //MARK: - Variables
    private lazy var HomeVM = HomeViewModel()
    
    //MARK: - UI Components
    var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createFlowLayout())
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeVM.view = self
        HomeVM.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        HomeVM.viewDidAppear()
    }
}

    //MARK: - CollectionView Settings
extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeVM.characters.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 32) / 2
        let height = self.view.frame.height / 2.1
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeScreenCell.identifier, for: indexPath) as! HomeScreenCell
        cell.setHomeScreenCell(character: HomeVM.characters[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        HomeVM.fetchDetail(id: HomeVM.characters[indexPath.item].id)
    }
    
}

    //MARK: - Pagination
extension HomeView {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        HomeVM.scrollViewDidScroll(scrollView)
    }
}

    //MARK: - Setup UI
extension HomeView: HomeInterface {
    func navigateToDetails(character: CharactersModel) {
        DispatchQueue.main.async {
            let cellDetailVC = CharactersDetailScreen(character: character)
            self.navigationController?.pushViewController(cellDetailVC, animated: true)
        }
    }
    
    func setupNavigationItem() {
        navigationItem.title = "Rick and Morty"
    }
    func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(HomeScreenCell.self, forCellWithReuseIdentifier: HomeScreenCell.identifier)
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
