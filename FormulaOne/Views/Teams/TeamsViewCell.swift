//
//  TeamsViewCell.swift
//  FormulaOne
//
//  Created by Nathan Mora on 03/05/24.
//

import UIKit

class TeamsViewCell: UITableViewCell {
   
   var stackView = UIStackView()
   var positionLabel = UILabel()
   var nameTeamLabel = UILabel()
   var pointsLabel = UILabel()
   var imageLogo = UIImageView()
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
      
      positionLabel.font = .customFontSubtitle(ofSize: 20)
      positionLabel.textColor = .custom(style: .yellowRetroColor)
      
      //nameTeamLabel.textColor = .custom(style: .yellowRetroColor)
      nameTeamLabel.font = .customFontTitle(ofSize: 18)
      nameTeamLabel.numberOfLines = 0
      
      imageLogo.contentMode = .scaleAspectFit
      
      pointsLabel.applyShadow()
      pointsLabel.applyRetroStyle()
      
   }
   
   private func constraint() {
      
      addSubviews(positionLabel, nameTeamLabel, pointsLabel)
      
      for views in [positionLabel, nameTeamLabel, pointsLabel] {
         views.translatesAutoresizingMaskIntoConstraints = false
      }
      
      NSLayoutConstraint.activate([
         
         positionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
         positionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
         positionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
         
         nameTeamLabel.centerYAnchor.constraint(equalTo: positionLabel.centerYAnchor),
         nameTeamLabel.leadingAnchor.constraint(equalTo: positionLabel.trailingAnchor, constant: 18),
         
         pointsLabel.topAnchor.constraint(equalTo: nameTeamLabel.topAnchor),
         pointsLabel.leadingAnchor.constraint(equalTo: nameTeamLabel.trailingAnchor, constant: 8),
         pointsLabel.heightAnchor.constraint(equalToConstant: 35),
         pointsLabel.widthAnchor.constraint(equalToConstant: 58),
         pointsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
      ])
   }
   
   func configure(with dataTeams: Response, isEvenRow: Bool) {
      positionLabel.text = dataTeams.position?.formatted()
      nameTeamLabel.text = dataTeams.team?.name
      pointsLabel.text = dataTeams.points?.formatted()
      
      let backgroundColor = isEvenRow ? UIColor.secondarySystemBackground : .custom(style: .grayRetroColor)
      contentView.backgroundColor = backgroundColor
      
      
      if isEvenRow {
         pointsLabel.backgroundColor = .custom(style: .grayRetroColor)
      } else {
         pointsLabel.backgroundColor = .custom(style: .redRetroColor)
         nameTeamLabel.textColor = textColor
      }
   }
   
}
