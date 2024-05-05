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
   let view = UIView()
   let nameDriverLabel = UILabel()
   let pointsDriverLabel = UILabel()
   let teamLabel =  UILabel()
   let textColor = UIColor.dynamicText
   
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
      
      //backgroundColor = .systemGray6
      
      positionDriverLabel.font = UIFont.customFontSubtitle(ofSize: 20)
      positionDriverLabel.textColor = .custom(style: .yellowRetroColor)
      
      nameDriverLabel.font = UIFont.customFontSubtitle(ofSize: 24)
      nameDriverLabel.numberOfLines = 0
      
      teamLabel.font = UIFont.customFontSubtitle(ofSize: 16)
      teamLabel.numberOfLines = 0
      
      pointsDriverLabel.applyShadow()
      pointsDriverLabel.applyRetroStyle()
      
      stack.axis = .vertical
      stack.distribution = .fillEqually
      
   }
   
   private func constraint() {
      
      addSubviews(positionDriverLabel, stack, pointsDriverLabel)
      stack.addArrangedSubviews(nameDriverLabel, teamLabel)
      
      
      for views in [positionDriverLabel, stack, pointsDriverLabel] {
         views.translatesAutoresizingMaskIntoConstraints = false
      }
      
      NSLayoutConstraint.activate([
         
         positionDriverLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         positionDriverLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
         
         stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stack.leadingAnchor.constraint(equalTo: positionDriverLabel.trailingAnchor, constant: 18),
         stack.heightAnchor.constraint(equalToConstant: 30),
         stack.widthAnchor.constraint(equalToConstant: 180),
         
         pointsDriverLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         pointsDriverLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
         pointsDriverLabel.heightAnchor.constraint(equalToConstant: 35),
         pointsDriverLabel.widthAnchor.constraint(equalToConstant: 58)
         
      ])
   }
   
   func configure(with driverData: Response, isEvenRow: Bool) {
      positionDriverLabel.text = driverData.position?.formatted()
      nameDriverLabel.text = driverData.driver?.name
      teamLabel.text = driverData.team?.name
      pointsDriverLabel.text = "\(String(describing: driverData.points)) pts"
      
      let backgroundColor = isEvenRow ? UIColor.secondarySystemBackground : .custom(style: .grayRetroColor)
      contentView.backgroundColor = backgroundColor
      
      
      if isEvenRow {
         pointsDriverLabel.backgroundColor = .custom(style: .grayRetroColor)
      } else {
         pointsDriverLabel.backgroundColor = .custom(style: .redRetroColor)
         nameDriverLabel.textColor = textColor
         teamLabel.textColor = textColor
      }
   }
   
}
