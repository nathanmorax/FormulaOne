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
      addSubviews(positionDriverLabel, view, stack, pointsDriverLabel)
      stack.addArrangedSubviews(nameDriverLabel, teamLabel)
      
      positionDriverLabel.translatesAutoresizingMaskIntoConstraints = false
      view.translatesAutoresizingMaskIntoConstraints = false
      stack.translatesAutoresizingMaskIntoConstraints = false
      pointsDriverLabel.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         positionDriverLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         positionDriverLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
         
         view.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         view.leadingAnchor.constraint(equalTo: positionDriverLabel.leadingAnchor, constant: 18),
         view.widthAnchor.constraint(equalToConstant: 2),
         view.heightAnchor.constraint(equalToConstant: 35),
         
         stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stack.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 18),
         stack.heightAnchor.constraint(equalToConstant: 30),
         stack.widthAnchor.constraint(equalToConstant: 180),
         
         pointsDriverLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         pointsDriverLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
         
      ])
   }
   
}
