//
//  DriverDetailController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 08/06/24.
//

import UIKit
import SwiftUI

class DriverDetailController: UICollectionViewController {
    
    let cellId = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        constraint()
    }
    
    init() {
        super.init(collectionViewLayout: DriverDetailController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        view.backgroundColor = .systemBackground

        
        collectionView.register(HeaderCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func constraint() {
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) ->
        NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                item.contentInsets.trailing = 8
                item.contentInsets.leading = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                
                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(190)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.top = 14
                section.contentInsets.leading = 8
                section.contentInsets.trailing = 8
                
                return section
            }
            
        }
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 1
        default: return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        //cell.backgroundColor = .cyan
        
        return cell
    }
    
}

class HeaderCollectionCell: UICollectionViewCell {
    
    let imageDriver = UIImageView()
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let countryLabel = UILabel()
    let imageLocation = UIImageView()
    let teamLabel = UILabel()
    let separator = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        imageDriver.image = UIImage(named: "driver")
        imageDriver.backgroundColor = .systemPink
        imageDriver.layer.cornerRadius = 4
        imageDriver.layer.borderColor = UIColor.black.cgColor
        imageDriver.layer.borderWidth = 2
        
        nameLabel.text = "Sergio Michel Pérez Mendoza"
        nameLabel.font = UIFont.customFontTitle(ofSize: 14)
        nameLabel.numberOfLines = 0
        
        countryLabel.text = "Mexico"
        countryLabel.font = UIFont.customFontSubtitle(ofSize: 14)
        
        imageLocation.image = UIImage(systemName: "mappin.and.ellipse")
        imageLocation.tintColor = .black
        
        teamLabel.text = "Red Bull Racing"
        teamLabel.font = UIFont.customFontSubtitle(ofSize: 14)

        stackView.axis = .horizontal
        stackView.spacing = 10
        
        separator.backgroundColor = .black
        
    }
    
    private func constraint() {
        
        addSubviews(imageDriver, nameLabel, stackView)
        stackView.addArrangedSubviews(countryLabel, imageLocation, separator, teamLabel)
        
        
        for views in [imageDriver, nameLabel, stackView] {
           views.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageDriver.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageDriver.topAnchor.constraint(equalTo: self.topAnchor),
            imageDriver.heightAnchor.constraint(equalToConstant: 100),
            imageDriver.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: imageDriver.bottomAnchor, constant: 12),
            nameLabel.centerXAnchor.constraint(equalTo: imageDriver.centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            imageLocation.heightAnchor.constraint(equalToConstant: 15),
            imageLocation.widthAnchor.constraint(equalToConstant: 15),
            
            separator.heightAnchor.constraint(equalToConstant: 20),
            separator.widthAnchor.constraint(equalToConstant: 1)

        ])
        
    }
    
}


struct DriverDetailController_Previews: UIViewControllerRepresentable {
    typealias UIViewControllerType = DriverDetailController

    func makeUIViewController(context: Context) -> DriverDetailController {
        DriverDetailController()
    }
    
    func updateUIViewController(_ uiViewController: DriverDetailController, context: Context) {
        
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailController_Previews()
            .edgesIgnoringSafeArea(.all)
    }
}



