//
//  EpisodeDetailScreen.swift
//  RickAndMortyApp
//
//  Created by Nebula on 23.03.24.
//

import UIKit

protocol EpisodeDetailScreenInterface: AnyObject {
    func setupUI()
    func setupCollectionView()
    func setupNavigationController()
    var episode: EpisodesModel {get}
}

final class EpisodeDetailScreen: UIViewController {

    //MARK: - Variables
    var episode: EpisodesModel
    private lazy var episodeDetailVM = EpisodeDetailViewModel()

    //MARK: - UI Components
    private let episodeDetailCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createFlowLayout())
        return cv
    }()
    
    
    //MARK: - init
    init(episode: EpisodesModel) {
        self.episode = episode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        episodeDetailVM.view = self
        episodeDetailVM.viewDidLoad()
    }

}


    //MARK: - CollectionView Settings
extension EpisodeDetailScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return episodeDetailVM.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = episodeDetailVM.sections[section]
        
        switch sectionType {
        case .airDate:
            return 1
        case .characters(viewModels: let viewModels):
            return viewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionType = episodeDetailVM.sections[indexPath.section]
        
        switch sectionType {
        case .airDate:
            return CGSize(width: CGFloat.dWidth - 30, height: CGFloat.dHeight * 0.15)
        case .characters(viewModels: _):
            return CGSize(width: CGFloat.dWidth - 30, height: 90)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = episodeDetailVM.sections[indexPath.section]
        
        switch sectionType {
        case .airDate:
            let cell = episodeDetailCollectionView.dequeueReusableCell(withReuseIdentifier: EpisodeInfoCell.identifier, for: indexPath) as! EpisodeInfoCell
            cell.setCell(episode: episode)
            return cell
        case .characters(viewModels: let viewModels):
            let cell = episodeDetailCollectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCharactersCell.identifier, for: indexPath) as! EpisodeCharactersCell
            cell.setCell(viewModel: viewModels[indexPath.item])
            return cell
        }
    }
    
}


    //MARK: - Setup UI
extension EpisodeDetailScreen: EpisodeDetailScreenInterface {
    func setupUI() {
        view.addSubview(episodeDetailCollectionView)
        
        episodeDetailCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            episodeDetailCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            episodeDetailCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodeDetailCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodeDetailCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupCollectionView() {
        episodeDetailCollectionView.register(EpisodeInfoCell.self, forCellWithReuseIdentifier: EpisodeInfoCell.identifier)
        episodeDetailCollectionView.register(EpisodeCharactersCell.self, forCellWithReuseIdentifier: EpisodeCharactersCell.identifier)
        episodeDetailCollectionView.dataSource = self
        episodeDetailCollectionView.delegate = self
    }
    
    func setupNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = episode.name.uppercased()
    }
    
}
