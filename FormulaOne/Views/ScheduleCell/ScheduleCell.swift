//
//  ScheduleCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class ScheduleCell: UICollectionViewCell {
   
   private let stack = UIStackView()
   private let separator = UIView()
   let dateLabel = UILabel()
   let countryImage = UIImageView()
   var nameCircuitLabel = UILabel()
   let locationCircuitLabel = UILabel()
   
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
      configureView()
      constraint()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func layoutSubviews() {
      super.layoutSubviews()
      
      self.contentView.frame = self.bounds
   }
   
   private func configure() {
                  
      self.separator.backgroundColor = .quaternaryLabel
      
      
      self.nameCircuitLabel.numberOfLines = 0
      self.nameCircuitLabel.font = UIFont.customFontTitle(ofSize: 17)
      self.nameCircuitLabel.textColor = .custom(style: .yellowRetroColor)
      
      self.locationCircuitLabel.numberOfLines = 0
      self.locationCircuitLabel.textColor = .white
      self.locationCircuitLabel.font = UIFont.customFontSubtitle(ofSize: 14)
      
      self.dateLabel.numberOfLines = 0
      self.dateLabel.textColor = .white
      self.dateLabel.font = UIFont.customFontSubtitle(ofSize: 14)
      
      self.stack.axis = .vertical
      self.stack.spacing = 4
      
   }
   
   private func constraint() {
      
      addSubviews(countryImage, separator, stack)
      stack.addArrangedSubviews(nameCircuitLabel, locationCircuitLabel, dateLabel)
      
      countryImage.translatesAutoresizingMaskIntoConstraints = false
      separator.translatesAutoresizingMaskIntoConstraints = false
      stack.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         countryImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         countryImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
         countryImage.widthAnchor.constraint(equalToConstant: 60),
         countryImage.heightAnchor.constraint(equalToConstant: 65),
         
         separator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         separator.leadingAnchor.constraint(equalTo: countryImage.trailingAnchor, constant: 18),
         separator.heightAnchor.constraint(equalToConstant: 75),
         separator.widthAnchor.constraint(equalToConstant: 1),
         
         stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stack.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 18),
         stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         stack.heightAnchor.constraint(equalToConstant: 70)
         
      ])
   }
}
