//
//  ScheduleDetailCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 30/03/24.
//

import UIKit

class ScheduleDetailCell: UICollectionViewCell {
   static let scheduleDetailId = "scheduleDetailId"
   let typeRaceLabel = UILabel()
   let dateLabel = UILabel()
   let statusLabel = UILabel()
   //let imageView = UIImageView()
   
   
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
      
      contentView.backgroundColor = UIColor.custom(style: .grayRetroColorClear)
      
      //dateLabel.font = NSAttributedString.setTextBold(<#T##String#>, fontSize: <#T##CGFloat#>)
      dateLabel.numberOfLines = 0
      dateLabel.textAlignment = .center
   
      
   }
   
   private func constraint() {
      
      addSubview(dateLabel)
      
      dateLabel.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
         dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
         dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
         dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)
      ])
   }
}

