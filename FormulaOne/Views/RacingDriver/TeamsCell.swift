//
//  TeamsCell.swift
//  FormulaOne
//
//  Created by Jesus Mora on 10/07/24.
//

import UIKit

class TeamsCell: UICollectionViewCell {
    static let teamsCellId = "TeamsCellId"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.backgroundColor = UIColor.custom(style: .grayRetroColorClear)

        
    }
    
    private func constraint() {
        
    }

}
