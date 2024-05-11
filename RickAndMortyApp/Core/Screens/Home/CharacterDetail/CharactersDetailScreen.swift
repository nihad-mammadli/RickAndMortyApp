//
//  CharactersDetailScreen.swift
//  RickAndMortyApp
//
//  Created by Nebula on 05.03.24.
//

import UIKit

protocol CharacterDetailInterface : AnyObject {
    func setupUI()
    func setupNavigationController()
    func setupCollectionView()
    var character: CharactersModel {get}
}

final class CharactersDetailScreen: UIViewController {
    
    // MARK: - Variables
    
    var character: CharactersModel
    private lazy var CharacterDetailVM = CharacterDetailViewModel()
    
    // MARK: - UI Components
    
    private let characterInfoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    // MARK: - init
    init(character: CharactersModel) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        CharacterDetailVM.view = self
        CharacterDetailVM.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}
    //MARK: - CollectionView Settings 
extension CharactersDetailScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CharacterDetailVM.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = CharacterDetailVM.sections[section]
        
        switch sectionType {
        case .photo:
            return 1
        case .information(viewModels: let viewModels):
            return viewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = CharacterDetailVM.sections[indexPath.section]
        switch sectionType {
        case .photo:
            let cell = characterInfoCollectionView.dequeueReusableCell(withReuseIdentifier: CharacterImageCell.identifier, for: indexPath) as! CharacterImageCell
            cell.setCell(character: character)
            return cell
        case .information(viewModels: let viewModels):
            let cell = characterInfoCollectionView.dequeueReusableCell(withReuseIdentifier: CharacterInfoCell.identifier, for: indexPath) as! CharacterInfoCell
            cell.setCell(with: viewModels[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionType = CharacterDetailVM.sections[section]
        switch sectionType {
        case .photo:
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        case .information(viewModels: _ ):
            return UIEdgeInsets(top: 10, left: 3, bottom: 0, right: 3)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: CGFloat.dWidth, height: 400)
        } else if indexPath.section == 1 {
            return CGSize(width: (CGFloat.dWidth / 2) - 6, height: 150)
        } else {
            return CGSize(width: CGFloat.dWidth, height: 100)
        }
    }
}
    // MARK: - Setup UI
extension CharactersDetailScreen: CharacterDetailInterface {
    func setupUI() {
        self.view.addSubview(characterInfoCollectionView)
        
        characterInfoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterInfoCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            characterInfoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            characterInfoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterInfoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupCollectionView() {
        self.characterInfoCollectionView.dataSource = self
        self.characterInfoCollectionView.delegate = self
        self.characterInfoCollectionView.register(CharacterImageCell.self, forCellWithReuseIdentifier: CharacterImageCell.identifier)
        self.characterInfoCollectionView.register(CharacterInfoCell.self, forCellWithReuseIdentifier: CharacterInfoCell.identifier)
    }
    
    func setupNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = character.name.uppercased()
    }
}
