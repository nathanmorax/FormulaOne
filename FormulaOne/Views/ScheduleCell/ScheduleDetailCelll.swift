//
//  ScheduleDetailCelll.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 07/04/24.
//

import UIKit

class ScheduleDetailCelll: UITableViewCell {
    
    private let stack = UIStackView()
    let typeRaceLabel = UILabel()
    let dateLabel = UILabel()
    let statusLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
        constraint()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configure() {
        
        backgroundColor = .systemGray6
        
        typeRaceLabel.font = .custom(style: .headline)
        dateLabel.font = .custom(style: .subheadline)
        statusLabel.font = .custom(style: .subheadline)
        
        //imageView.tintColor = .green
        
        stack.axis = .vertical
        stack.spacing = 4
        
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
