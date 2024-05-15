//
//  ScheduleDetailHeaderCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 08/04/24.
//

import UIKit

class ScheduleDetailHeaderCell: UICollectionViewCell {
   static let scheduleHeaderId = "scheduleHeaderId"
   private let stackView = UIStackView()
   let countryLabel = UILabel()
   let cityLabel = UILabel()
   let circuitLabel = UILabel()
   
   
   /* override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
    constraint()
    
    }*/
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
      constraint()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   private func configure() {
      
      
      contentView.backgroundColor = .blue
      
      circuitLabel.font = UIFont.customFontSubtitle(ofSize: 28)
      countryLabel.font = UIFont.customFontTitle(ofSize: 24)
      cityLabel.font = UIFont.customFontSubtitle(ofSize: 19)
      
      
      stackView.axis = .vertical
         
   }
   
   private func constraint() {
      
      addSubview(stackView)
      
      stackView.addArrangedSubviews(countryLabel, cityLabel, circuitLabel)
      
      stackView.translatesAutoresizingMaskIntoConstraints = false
   
      NSLayoutConstraint.activate([
         
         stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
         stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
         stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
         stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)

      ])
   }
   
}
