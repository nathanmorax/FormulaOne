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
      
      backgroundColor = .lightGray

      titleCountryLabel.text = "COUNTRY"
      countryLabel.font = .custom(style: .headline)
      cityLabel.font = .custom(style: .subheadline)
      
      titleLengthLabel.text = "LENGTH"
      kmLabel.text = " "
      distanceLabel.font = .custom(style: .subheadline)
      
      separator.backgroundColor = .quaternaryLabel
      
      //imageView.tintColor = .green
      
      stackLocation.axis = .vertical
      stackLocation.distribution = .fillProportionally
      
      stackLength.axis = .vertical
      stackLength.distribution = .fillProportionally

         
   }
   
   private func constraint() {
      
      addSubviews(stackLocation, separator, stackLength)
      stackLocation.addArrangedSubviews(titleCountryLabel, countryLabel, cityLabel)
      stackLength.addArrangedSubviews(titleLengthLabel, distanceLabel, kmLabel)
      
      stackLocation.translatesAutoresizingMaskIntoConstraints = false
      separator.translatesAutoresizingMaskIntoConstraints = false
      stackLength.translatesAutoresizingMaskIntoConstraints = false

      
      NSLayoutConstraint.activate([
         
         //stackLocation.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 8),
         //stackLocation.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
         stackLocation.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stackLocation.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
         stackLocation.heightAnchor.constraint(equalToConstant: 40),
         //stackLocation.trailingAnchor.constraint(equalTo: stackLength.leadingAnchor),
         
         separator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         separator.leadingAnchor.constraint(equalTo: stackLocation.trailingAnchor, constant: 8),
         separator.heightAnchor.constraint(equalToConstant: 55),
         separator.widthAnchor.constraint(equalToConstant: 1),

         
         stackLength.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         //stackLength.topAnchor.constraint(equalTo: self.stackLocation.topAnchor),
         stackLength.leadingAnchor.constraint(equalTo: separator.trailingAnchor),
         stackLength.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         stackLength.heightAnchor.constraint(equalToConstant: 40),
         
         //
         
        
      ])
   }
   
}
