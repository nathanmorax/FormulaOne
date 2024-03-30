//
//  ScheduleDetailCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 30/03/24.
//

import UIKit

class ScheduleDetailCell: UICollectionViewCell {
    
    private let stack = UIStackView()
    let typeRaceLabel = UILabel()
    let dateLabel = UILabel()
    let statusLabel = UILabel()
    let imageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        backgroundColor = .systemGray6
        
        typeRaceLabel.font = .custom(style: .headline)
        dateLabel.font = .custom(style: .subheadline)
        statusLabel.font = .custom(style: .subheadline)
        
        imageView.tintColor = .green
        
        stack.axis = .vertical
        stack.spacing = 4
        
    }
    
    private func constraint() {
        
        addSubviews(stack, imageView)
        stack.addArrangedSubviews(typeRaceLabel, dateLabel, statusLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.heightAnchor.constraint(equalToConstant: 50),
            
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: stack.trailingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 26)
            
        ])
    }
}

