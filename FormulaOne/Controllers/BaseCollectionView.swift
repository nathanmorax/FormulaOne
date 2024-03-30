//
//  BaseCollectionView.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit


class BaseCollectionView: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
