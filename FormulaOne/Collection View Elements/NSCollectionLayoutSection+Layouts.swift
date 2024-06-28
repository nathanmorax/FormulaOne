//
//  NSCollectionLayoutSection+Layouts.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 13/06/24.
//

import UIKit

extension NSCollectionLayoutSection {
    
    static func sideOneItem(headerItem: NSCollectionLayoutBoundarySupplementaryItem) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 8
        item.contentInsets.leading = 8
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 8
        section.contentInsets.top = 14
        section.boundarySupplementaryItems = [headerItem]

        return section
    }
    
    static func sideScrollingOneItem(headerItem: NSCollectionLayoutBoundarySupplementaryItem) -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(90)))
        item.contentInsets.trailing = 8
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 14
        section.contentInsets.leading = 8
        section.orthogonalScrollingBehavior = .paging
        section.boundarySupplementaryItems = [headerItem]

        return section
    }
    
    static func stackViewWithSixItems(headerItem: NSCollectionLayoutBoundarySupplementaryItem) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(190)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 14
        section.contentInsets.leading = 8
        section.contentInsets.trailing = 8
        section.boundarySupplementaryItems = [headerItem]
        return section
    }
    
}
