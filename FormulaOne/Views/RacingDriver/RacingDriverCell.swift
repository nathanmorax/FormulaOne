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
      
      //self.contentView.backgroundColor = grayRetroColor


      //positionDriverLabel.font = .custom(style: .subheadline)
      positionDriverLabel.textColor = .secondaryLabel
      positionDriverLabel.font = UIFont(name: "C&CRedAlertINET", size: 20)
      positionDriverLabel.textColor = yewllowColor

      
      //nameDriverLabel.font = .custom(style: .headline)
      nameDriverLabel.font = UIFont(name: "C&CRedAlertINET", size: 24)
      nameDriverLabel.numberOfLines = 0

      
      //teamLabel.font = .custom(style: .subheadline)
      teamLabel.font = UIFont(name: "C&CRedAlertINET", size: 16)
      teamLabel.numberOfLines = 0
      
      //pointsDriverLabel.font = .custom(style: .subheadline)
      
      pointsDriverLabel.layer.shadowColor = UIColor.black.cgColor
      pointsDriverLabel.layer.shadowOffset = CGSize(width: 2, height: 2) // Desplazamiento del sombreado en la dirección derecha y abajo
      pointsDriverLabel.layer.shadowOpacity = 1 // Opacidad de la sombra
      pointsDriverLabel.layer.shadowRadius = 9 // Radio de la sombra
      pointsDriverLabel.layer.masksToBounds = false
      
      pointsDriverLabel.font = UIFont(name: "C&CRedAlertINET", size: 14)
      pointsDriverLabel.textColor = .white
      pointsDriverLabel.textAlignment = .center
      pointsDriverLabel.layer.borderWidth = 1
      pointsDriverLabel.layer.borderColor = UIColor.black.cgColor
      pointsDriverLabel.layer.cornerRadius = 9
      pointsDriverLabel.layer.masksToBounds = true
   
      
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
         pointsDriverLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
         pointsDriverLabel.heightAnchor.constraint(equalToConstant: 32),
         pointsDriverLabel.widthAnchor.constraint(equalToConstant: 42)
         
      ])
   }
   
}
