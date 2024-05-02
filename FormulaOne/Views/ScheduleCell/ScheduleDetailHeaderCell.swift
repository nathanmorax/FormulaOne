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
   private let separator = UIView()
   let titleCountryLabel = UILabel()
   let countryLabel = UILabel()
   let cityLabel = UILabel()
   let titleLengthLabel = UILabel()
   let distanceLabel = UILabel()
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
      
      backgroundColor = .clear

      titleCountryLabel.text = "COUNTRY"
      titleCountryLabel.textColor = .black
      titleCountryLabel.font = UIFont(name: "Superstcrea", size: 18)
      
      
      countryLabel.font = UIFont(name: "Formula1-Display-Regular", size: 9)
      cityLabel.font = UIFont(name: "Formula1-Display-Regular", size: 9)
      
      titleLengthLabel.text = "LENGTH"
      titleLengthLabel.textColor = .black
      titleLengthLabel.font = UIFont(name: "Superstcrea", size: 18)
      kmLabel.text = " "
      distanceLabel.font = UIFont(name: "Formula1-Display-Regular", size: 9)
      
      
      stackLocation.axis = .vertical
      stackLocation.backgroundColor = grayRetroColor
      stackLocation.layer.cornerRadius = 8
      stackLocation.layer.masksToBounds = true
      
      
      stackLength.axis = .vertical
      stackLength.backgroundColor = grayRetroColor
      stackLength.layer.cornerRadius = 8
      stackLength.layer.masksToBounds = true


         
   }
   
   private func constraint() {
      
      addSubviews(stackLocation, stackLength)
      stackLocation.addArrangedSubviews(titleCountryLabel, countryLabel, cityLabel)
      stackLength.addArrangedSubviews(titleLengthLabel, distanceLabel)
      
      stackLocation.translatesAutoresizingMaskIntoConstraints = false
      stackLength.translatesAutoresizingMaskIntoConstraints = false

      
      NSLayoutConstraint.activate([
         stackLocation.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stackLocation.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
         stackLocation.heightAnchor.constraint(equalToConstant: 40),
         stackLocation.trailingAnchor.constraint(equalTo: self.stackLength.leadingAnchor, constant: -84),
         
         stackLength.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stackLength.leadingAnchor.constraint(equalTo: stackLocation.trailingAnchor),
         stackLength.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
         stackLength.heightAnchor.constraint(equalToConstant: 50),

      ])
   }
   
}
