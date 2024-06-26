//
//  ScheduleAboutCell.swift
//  FormulaOne
//
//  Created by Nathan Mora on 10/05/24.
//

import UIKit

class ScheduleAboutCell: UICollectionViewCell {
    static let circuitAboutId = "scheduleCircuitAboutId"
    
    var mainStackView = UIStackView()
    let rowStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {

        mainStackView.axis = .vertical
        mainStackView.distribution = .fillProportionally

    }
    
    private func constraint() {
        
        addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
        
    }
    
    func configure(with circuitAbout: CircuitR) {
        // Clear existing labels
        mainStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // Add new labels
        let raceInfoDict: [String: Any] = [
            "First Grand Prix": circuitAbout.firstGrandPrix,
            "Laps": circuitAbout.laps,
            "Length": circuitAbout.length,
            "Race Distance": circuitAbout.raceDistance,
            "Capacity": circuitAbout.capacity ?? 0,
            "Opened": circuitAbout.opened ?? 0
        ]
        
        var infoArray: [[String: Any]] = []
        for (title, value) in raceInfoDict {
            infoArray.append([title: value])
        }
        
        let numberOfRows = 2
        let numberOfColumns = 3
        var currentIndex = 0
        
        for _ in 1...numberOfRows {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.alignment = .center
            rowStackView.spacing = 10
            
            for _ in 1...numberOfColumns {
                if currentIndex < infoArray.count {
                    let item = infoArray[currentIndex]
                    if let (title, value) = item.first {
                        
                        let titleLabel = UILabel()
                        let subtitleLabel = UILabel()
                        
                        titleLabel.font = UIFont.customFontTitle(ofSize: 14)
                        titleLabel.textAlignment = .left
                        
                        subtitleLabel.font = UIFont.customFontSubtitle(ofSize: 10)
                        subtitleLabel.textAlignment = .center
                        
                        titleLabel.text = title
                        subtitleLabel.text = "\(value)"
                        
                        let cellView = UIView()
                        cellView.backgroundColor = .systemGray6
                        cellView.addSubview(titleLabel)
                        cellView.addSubview(subtitleLabel)
                        
                        titleLabel.translatesAutoresizingMaskIntoConstraints = false
                        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
                        cellView.translatesAutoresizingMaskIntoConstraints = false
                        
                        NSLayoutConstraint.activate([
                            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor),
                            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 4),
                            titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
                            
                            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
                            subtitleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
                            subtitleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
                            subtitleLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -19),
                            
                            cellView.heightAnchor.constraint(equalToConstant: 80)
                            
                        ])
                        
                        rowStackView.addArrangedSubview(cellView)
                        currentIndex += 1
                    }
                }
            }
            
            mainStackView.addArrangedSubview(rowStackView)
        }
    }
    
}
