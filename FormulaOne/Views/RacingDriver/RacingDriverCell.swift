//
//  RacingDriverCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 31/03/24.
//

import UIKit

class RacingDriverCell: UITableViewCell {
    
    let stackH = UIStackView()
    let stackV = UIStackView()
    //let imageDriver = UIImageView()
    let positionDriverLabel = UILabel()
    let nameDriverLabel = UILabel()
    let pointsDriverLabel = UILabel()
    let nameTeamLabel =  UILabel()
    
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
        
        positionDriverLabel.font = .custom(style: .headline)
        
        nameDriverLabel.font = .custom(style: .headline)
        nameDriverLabel.numberOfLines = 0
        
        nameTeamLabel.font = .custom(style: .subheadline)
        nameTeamLabel.numberOfLines = 0
        
        pointsDriverLabel.font = .custom(style: .subheadline)
        
        stackH.axis = .horizontal
        stackH.distribution = .fillProportionally
        
        stackV.axis = .vertical
        stackV.spacing = 2
        
    }
    
    private func constraint() {
        addSubview(stackH)
        stackH.addArrangedSubviews(positionDriverLabel, stackV, pointsDriverLabel)
        stackV.addArrangedSubviews(nameDriverLabel, nameTeamLabel)
        
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackH.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackH.topAnchor.constraint(equalTo: self.topAnchor),
            stackH.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackH.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackH.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
