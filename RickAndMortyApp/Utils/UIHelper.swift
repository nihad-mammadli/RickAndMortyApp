//
//  UIHelper.swift
//  RickAndMortyApp
//
//  Created by Nebula on 16.03.24.
//

import UIKit

enum UIHelper {
    static func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 12
        return layout
    }
}

