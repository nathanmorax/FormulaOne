//
//  RacingDriverCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 31/03/24.
//

import UIKit

class RacingDriverCell: UITableViewCell {
   
   let stack = UIStackView()
   let positionDriverLabel = UILabel()
   let imageDriver = UIImageView()
   let nameDriverLabel = UILabel()
   let pointsDriverLabel = UILabel()
   let teamLabel =  UILabel()
   
   override func awakeFromNib() {
      super.awakeFromNib()
      configure()
      constraint()
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
      configure()
      constraint()
   }
   
   private func configure() {
      
      backgroundColor = .systemGray6

      positionDriverLabel.font = .custom(style: .subheadline)
      positionDriverLabel.textColor = .secondaryLabel
      
      nameDriverLabel.font = .custom(style: .headline)
      nameDriverLabel.numberOfLines = 0
      
      teamLabel.font = .custom(style: .subheadline)
      teamLabel.numberOfLines = 0
      
      pointsDriverLabel.font = .custom(style: .subheadline)
      pointsDriverLabel.textColor = .secondaryLabel
      
      stack.axis = .vertical
      stack.distribution = .fillEqually
      
   }
   
   private func constraint() {
      addSubviews(positionDriverLabel,imageDriver, stack, pointsDriverLabel)
      stack.addArrangedSubviews(nameDriverLabel, teamLabel)
      
      positionDriverLabel.translatesAutoresizingMaskIntoConstraints = false
      imageDriver.translatesAutoresizingMaskIntoConstraints = false
      stack.translatesAutoresizingMaskIntoConstraints = false
      pointsDriverLabel.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         positionDriverLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         positionDriverLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
         
         imageDriver.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         imageDriver.leadingAnchor.constraint(equalTo: positionDriverLabel.leadingAnchor, constant: 18),
         imageDriver.widthAnchor.constraint(equalToConstant: 30),
         imageDriver.heightAnchor.constraint(equalToConstant: 35),
         
         stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stack.leadingAnchor.constraint(equalTo: imageDriver.trailingAnchor, constant: 18),
         stack.heightAnchor.constraint(equalToConstant: 30),
         stack.widthAnchor.constraint(equalToConstant: 180),
         
         pointsDriverLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         pointsDriverLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
         
      ])
   }
   
}
