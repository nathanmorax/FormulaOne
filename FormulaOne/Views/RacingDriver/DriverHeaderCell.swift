//
//  DriverHeaderCell.swift
//  FormulaOne
//
//  Created by Nathan Mora on 09/04/24.
//

import UIKit

class DriverHeaderCell: UICollectionViewCell {
    static let driverHeaderCellId = "driverHeaderCellId"
    
    let vstackView = UIStackView()
    let hstackView = UIStackView()

    let imageDriver = UIImageView()
    let nameLabel = UILabel()
    let countryLabel = UILabel()
    let teamLabel = UILabel()
    let positionLabel = UILabel()
    let pointsLabel = UILabel()
    let separator = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        imageDriver.image = UIImage(named: "driver")
        imageDriver.backgroundColor = .systemPink
        imageDriver.layer.cornerRadius = 4
        imageDriver.layer.borderColor = UIColor.black.cgColor
        imageDriver.layer.borderWidth = 2
        
        nameLabel.font = UIFont.customFontTitle(ofSize: 19)
        nameLabel.numberOfLines = 0
        
        teamLabel.text = "Red Bull Racing"
        teamLabel.font = UIFont.customFontSubtitle(ofSize: 18)
        
        positionLabel.text = "6"
        positionLabel.font = UIFont.customFontSubtitle(ofSize: 28)
        
        pointsLabel.text = "118"
        pointsLabel.font = UIFont.customFontSubtitle(ofSize: 28)
        
        vstackView.axis = .vertical
        vstackView.spacing = 10
        
        hstackView.axis = .horizontal
        
        
    }
    
    private func constraint() {
        
        hstackView.addArrangedSubviews(positionLabel, pointsLabel)
        vstackView.addArrangedSubviews(nameLabel, teamLabel, hstackView)
        addSubviews(vstackView, imageDriver)
        
        
        for views in [vstackView, imageDriver] {
            views.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            vstackView.centerYAnchor.constraint(equalTo: imageDriver.centerYAnchor),
            vstackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            
            imageDriver.heightAnchor.constraint(equalToConstant: 100),
            imageDriver.widthAnchor.constraint(equalToConstant: 100),
            imageDriver.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            imageDriver.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
            
            
            
        ])
        
    }
}
