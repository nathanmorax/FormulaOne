//
//  DriverHeaderCell.swift
//  FormulaOne
//
//  Created by Nathan Mora on 09/04/24.
//

import UIKit

class DriverHeaderCell: UICollectionViewCell {
   
   var image = UIImageView()
   var stackView = UIStackView()
   var nameLabel = UILabel()
   var nationalityLabel = UILabel()
   var separator = UIView()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
      constraint()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   private func configure() {
      
      
      nameLabel.font = .custom(style: .footnote)
      nationalityLabel.font = .custom(style: .subheadline)
      
      separator.backgroundColor = .quaternaryLabel
      
      image.layer.cornerRadius = 8
      
      stackView.axis = .vertical
      
   }
   
   private func constraint() {
      
      addSubviews(image, stackView, separator)
      stackView.addArrangedSubviews(nameLabel, nationalityLabel)
      
      image.translatesAutoresizingMaskIntoConstraints = false
      stackView.translatesAutoresizingMaskIntoConstraints = false
      separator.translatesAutoresizingMaskIntoConstraints = false

      NSLayoutConstraint.activate([
         
         image.topAnchor.constraint(equalTo: self.topAnchor),
         image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
         image.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -12),
         image.heightAnchor.constraint(equalToConstant: 80),
         image.widthAnchor.constraint(equalToConstant: 80),
         
         stackView.topAnchor.constraint(equalTo: image.topAnchor),
         //stackView.leadingAnchor.constraint(equalTo: image.trailingAnchor),
         stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -28),
         stackView.heightAnchor.constraint(equalToConstant: 45),
         
         //separator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         separator.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 12),
         separator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
         separator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
         separator.heightAnchor.constraint(equalToConstant: 1),
         //separator.widthAnchor.constraint(equalToConstant: 120),
         
      
      ])
      
      
   }
    
}
