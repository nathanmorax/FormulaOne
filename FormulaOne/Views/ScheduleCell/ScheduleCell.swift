//
//  ScheduleCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class ScheduleCell: UICollectionViewCell {
    
    let stack = UIStackView()
    let dateLabel = UILabel()
    let nameCircuitLabel = UILabel()
    let locationCircuitLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        //configure()
        //constraint()
    }
    
    private func configure() {
        
        backgroundColor = .systemGray6
        
        dateLabel.numberOfLines = 0
        dateLabel.font = .custom(style: .subheadline)
        dateLabel.textAlignment = .center
        
        nameCircuitLabel.numberOfLines = 0
        nameCircuitLabel.font = .custom(style: .headline)
        
        locationCircuitLabel.numberOfLines = 1
        locationCircuitLabel.font = .custom(style: .subheadline)
        
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 8
        
    }
    
    private func constraint() {
        
        addSubviews(dateLabel, stack)
        stack.addArrangedSubviews(nameCircuitLabel, locationCircuitLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            dateLabel.widthAnchor.constraint(equalToConstant: 70),
            dateLabel.heightAnchor.constraint(equalToConstant: 75),
            
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
