//
//  ScheduleDetailHeaderCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 08/04/24.
//

import UIKit

class ScheduleDetailHeaderCell: UITableViewCell {

    private let stackLocation = UIStackView()
    private let stackLength1 = UIStackView()
    private let stackLength = UIStackView()
    let titleCountryLabel = UILabel()
    let countryLabel = UILabel()
    let nameCircuitLabel = UILabel()
    let titleLengthLabel = UILabel()
    let lenghtLabel = UILabel()
    let kmLabel = UILabel()
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
        
        
        titleCountryLabel.text = "COUNTRY"
        countryLabel.font = .custom(style: .headline)
        nameCircuitLabel.font = .custom(style: .subheadline)
        
        titleLengthLabel.text = "LENGTH"
        kmLabel.text = "Km"
        lenghtLabel.font = .custom(style: .subheadline)
        
        //imageView.tintColor = .green
        
        stackLocation.axis = .vertical
        stackLocation.distribution = .fillEqually
        
        stackLength.axis = .vertical
        stackLength.distribution = .fillEqually
        
        stackLength1.axis = .vertical
        stackLength1.distribution = .fillEqually

        

        
    }
    
    private func constraint() {
        
        addSubviews(stackLocation, stackLength, stackLength1)
        stackLocation.addArrangedSubviews(titleCountryLabel, countryLabel, nameCircuitLabel)
        stackLength.addArrangedSubviews(titleLengthLabel, lenghtLabel, kmLabel)
        stackLength1.addArrangedSubviews(titleLengthLabel, lenghtLabel, kmLabel)
        
        stackLocation.translatesAutoresizingMaskIntoConstraints = false
        stackLength.translatesAutoresizingMaskIntoConstraints = false
        stackLength1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            //stackLocation.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 8),
            stackLocation.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            stackLocation.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackLocation.heightAnchor.constraint(equalToConstant: 40),
            stackLocation.trailingAnchor.constraint(equalTo: stackLength.leadingAnchor),
            
            //stackLength.centerYAnchor.constraint(equalTo: stackLocation.centerYAnchor, constant: 8),
            stackLength.topAnchor.constraint(equalTo: self.stackLocation.topAnchor),
            stackLength.leadingAnchor.constraint(equalTo: stackLocation.trailingAnchor),
            stackLength.trailingAnchor.constraint(equalTo: stackLength1.leadingAnchor),
            stackLength.heightAnchor.constraint(equalToConstant: 40),
            
            stackLength1.topAnchor.constraint(equalTo: self.stackLength.topAnchor),
            stackLength1.leadingAnchor.constraint(equalTo: stackLength.trailingAnchor),
            stackLength1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackLength1.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
