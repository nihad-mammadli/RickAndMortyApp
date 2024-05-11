//
//  EpisodesView.swift
//  RickAndMortyApp
//
//  Created by Nebula on 07.03.24.
//

import UIKit

protocol EpisodesInterface: AnyObject {
    func setUpCollectionView()
    func setupUI()
    func navigateToDetails(episode: EpisodesModel)
    var episodesCollectionView: UICollectionView {get}
}

final class EpisodesView: UIViewController {
    // MARK: - Variables
    private lazy var EpisodesVM = EpisodesViewModel()
    
    // MARK: - UI Components
    var episodesCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createFlowLayout())
        return cv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        EpisodesVM.view = self
        EpisodesVM.viewDidLoad()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        EpisodesVM.viewDidAppear()
    }
    
}

    //MARK: - TableView Settings
extension EpisodesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EpisodesVM.episodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = episodesCollectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCell.identifier, for: indexPath) as! EpisodesCell
        cell.setCell(episode: EpisodesVM.episodes[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat.dWidth - 20.0 , height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        EpisodesVM.fetchDetail(id: EpisodesVM.episodes[indexPath.item].id)
    }
}
    
    //MARK: - Pagination
extension EpisodesView {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        EpisodesVM.scrollViewDidScroll(scrollView)
    }
}

    // MARK: - Setup UI
extension EpisodesView: EpisodesInterface {
     func setupUI() {
        view.addSubview(episodesCollectionView)

         episodesCollectionView.translatesAutoresizingMaskIntoConstraints = false
         
        NSLayoutConstraint.activate([
            episodesCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            episodesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            episodesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setUpCollectionView() {
        episodesCollectionView.dataSource = self
        episodesCollectionView.delegate = self
        episodesCollectionView.register(EpisodesCell.self, forCellWithReuseIdentifier: EpisodesCell.identifier)
    }
    
    func navigateToDetails(episode: EpisodesModel) {
        DispatchQueue.main.async {
            let cellDetailVC = EpisodeDetailScreen(episode: episode)
            self.navigationController?.pushViewController(cellDetailVC, animated: true)
        }
    }
}
