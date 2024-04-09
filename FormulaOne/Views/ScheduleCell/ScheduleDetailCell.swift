//
//  ScheduleDetailCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 30/03/24.
//

import UIKit

class ScheduleDetailCell: UITableViewCell {
    
    private let stack = UIStackView()
    let typeRaceLabel = UILabel()
    let dateLabel = UILabel()
    let statusLabel = UILabel()
    //let imageView = UIImageView()
    
    
   /* override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constraint()
        
    }*/
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        
        //imageView.tintColor = .green
        
        stack.axis = .vertical
        
    }
    
    private func constraint() {
        
        addSubviews(stack, statusLabel)
        stack.addArrangedSubviews(typeRaceLabel, dateLabel)
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: stack.trailingAnchor, constant: 24),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            statusLabel.heightAnchor.constraint(equalToConstant: 14),
            statusLabel.widthAnchor.constraint(equalToConstant: 80),            
        ])
    }
}

