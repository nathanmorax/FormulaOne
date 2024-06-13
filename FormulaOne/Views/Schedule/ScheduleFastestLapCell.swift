//
//  ScheduleFastestLapCell.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 11/06/24.
//

import UIKit

class ScheduleFastestLapCell: UICollectionViewCell {
    
    static let fastestLapId = "fastestLapId"
    
    let stackView =  UIStackView()
    let driverLabel = UILabel()
    let timeFastestDriverLabel = UILabel()
    let yearTimeFastestLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        contentView.backgroundColor = .systemGray5
        
        driverLabel.font = UIFont.customFontSubtitle(ofSize: 12)
        timeFastestDriverLabel.font = UIFont.customFontSubtitle(ofSize: 10)
        yearTimeFastestLabel.font = UIFont.customFontSubtitle(ofSize: 9)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
    }
    
    private func constraint() {
        addSubview(stackView)
        stackView.addArrangedSubviews(driverLabel, timeFastestDriverLabel, yearTimeFastestLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    func configure(with circuitAbout: CircuitR) {
        
        driverLabel.text = circuitAbout.lapRecord?.driver
        timeFastestDriverLabel.text = circuitAbout.lapRecord?.time
        yearTimeFastestLabel.text = circuitAbout.lapRecord?.year
    }
    
    
    
}
