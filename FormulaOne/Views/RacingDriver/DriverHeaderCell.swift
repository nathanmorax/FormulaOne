//
//  DriverHeaderCell.swift
//  FormulaOne
//
//  Created by Nathan Mora on 09/04/24.
//

import UIKit

class DriverHeaderCell: UICollectionViewCell {
    static let driverHeaderCellId = "driverHeaderCellId"
    
    let imageDriver = UIImageView()
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let countryLabel = UILabel()
    let imageLocation = UIImageView()
    let teamLabel = UILabel()
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
        
        //nameLabel.text = "Sergio Michel Pérez Mendoza"
        nameLabel.font = UIFont.customFontTitle(ofSize: 14)
        nameLabel.numberOfLines = 0
        
        //teamLabel.text = "Red Bull Racing"
        teamLabel.font = UIFont.customFontSubtitle(ofSize: 14)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        
    }
    
    private func constraint() {
        
        stackView.addArrangedSubviews(nameLabel, teamLabel)
        addSubviews(stackView, imageDriver)
        
        
        for views in [stackView, imageDriver] {
            views.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            stackView.centerYAnchor.constraint(equalTo: imageDriver.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            
            imageDriver.heightAnchor.constraint(equalToConstant: 100),
            imageDriver.widthAnchor.constraint(equalToConstant: 100),
            imageDriver.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            imageDriver.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
            
            
            
        ])
        
    }
}
