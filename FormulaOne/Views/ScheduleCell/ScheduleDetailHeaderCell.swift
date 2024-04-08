//
//  ScheduleDetailHeaderCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 08/04/24.
//

import UIKit

class ScheduleDetailHeaderCell: UITableViewCell {

    private let stack = UIStackView()
    let countryLabel = UILabel()
    let nameCircuitLabel = UILabel()
    let lenghtLabel = UILabel()
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
        
        countryLabel.font = .custom(style: .headline)
        nameCircuitLabel.font = .custom(style: .subheadline)
        lenghtLabel.font = .custom(style: .subheadline)
        
        //imageView.tintColor = .green
        
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        
    }
    
    private func constraint() {
        
        addSubviews(stack)
        stack.addArrangedSubviews(countryLabel, nameCircuitLabel, lenghtLabel)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 8),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8),
        ])
    }

}
