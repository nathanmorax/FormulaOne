//
//  DriverDetailController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 08/06/24.
//

import UIKit
import SwiftUI

class DriverDetailController: UICollectionViewController {
    
    var detailDriver: Response?
    lazy var driversDetails = [Drivers]()
    private var driverId: Int
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        constraint()
        fetchData()
        
    }
    
    init(driverId: Int) {
        self.driverId = driverId
        
        super.init(collectionViewLayout: DriverDetailController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        view.backgroundColor = .systemBackground
        
        collectionView.register(DriverHeaderCell.self, forCellWithReuseIdentifier: DriverHeaderCell.driverHeaderCellId)
        collectionView.register(ChampionshipCell.self, forCellWithReuseIdentifier: ChampionshipCell.championshipCellId)
        collectionView.register(TeamsCell.self, forCellWithReuseIdentifier: TeamsCell.teamsCellId)
        collectionView.register(AboutCell.self, forCellWithReuseIdentifier: AboutCell.aboutCellId)
        collectionView.register(ReusableHeaderView.self, forSupplementaryViewOfKind: ScheduleDetailController.ScheduleDetailHeaderId, withReuseIdentifier: ReusableHeaderView.headerId)
        
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
    
    private func fetchData() {
        
        
        APIService.shared.fetchDriver(driverId: driverId) {[weak self] result , error in
            guard let result, error == nil else { return }
            
            self?.driversDetails = result.response ?? []
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) ->
            NSCollectionLayoutSection? in
            
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),
                elementKind: ScheduleDetailController.ScheduleDetailHeaderId, alignment: .top
            )
            
            headerItem.pinToVisibleBounds = true
            headerItem.contentInsets.leading = 16
            headerItem.contentInsets.top = -18
            
            guard let sectionType = SectionDriver(rawValue: sectionNumber) else { return nil }
            
            
            switch sectionType {
                
            case .header:
                return NSCollectionLayoutSection.sideOneItem(headerItem: headerItem)
            case .championshipStanding:
                return NSCollectionLayoutSection.sideOneItem(headerItem: headerItem)
            case .team:
                
                return NSCollectionLayoutSection.sideScrollingOneItem(headerItem: headerItem)
            case .about:
                
                return NSCollectionLayoutSection.sideOneItem(headerItem: headerItem)
            }
            
        }
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionDriver.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let sectionType = SectionDriver(rawValue: section) else { return 0 }
        
        switch sectionType {
        case .header: return 1
        case .championshipStanding: return 1
        case .team: return 6
        case .about: return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let sectionType = SectionDriver(rawValue: indexPath.section)
        
        switch sectionType {
        case .header:
            guard let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: DriverHeaderCell.driverHeaderCellId, for: indexPath) as? DriverHeaderCell else { fatalError("Error al configurar la celda tipo") }
            
            //let url = URL(string: detailDriver[indexPath.item].image ?? "")
            //cell.image.sd_setImage(with: url)
            headerCell.nameLabel.text = detailDriver?.driver?.name
            headerCell.teamLabel.text = detailDriver?.team?.name
            
            if let positionDescription = detailDriver?.position?.description, let position = Int(positionDescription) {
                headerCell.positionLabel.text = getAbbreviatedPosition(from: position)
            } else {
                headerCell.positionLabel.text = ""
            }
            
            headerCell.pointsLabel.text = "\(detailDriver?.points?.description ?? "") pts"
            
            
            return headerCell
            
        case .championshipStanding:
            
            guard let championshipCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChampionshipCell.championshipCellId, for: indexPath) as? ChampionshipCell else { fatalError("Error al configurar la celda tipo") }
            
            championshipCell.backgroundColor = .blue
            
            return championshipCell
            
        case .team:
            
            guard let teamsCell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCell.teamsCellId, for: indexPath) as? TeamsCell else { fatalError("Error al configurar la celda tipo") }
            
            teamsCell.backgroundColor = .blue
            
            return teamsCell
            
        case .about:
            
            guard let aboutCell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutCell.aboutCellId, for: indexPath) as? AboutCell else { fatalError("Error al configurar la celda tipo") }
            
            aboutCell.backgroundColor = .blue
            
            return aboutCell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ReusableHeaderView.headerId, for: indexPath) as? ReusableHeaderView else { fatalError("Error al configurar la celda tipo") }
        
        if let sectionType = SectionDriver(rawValue: indexPath.section) {
            cell.titleLabel.attributedText = NSAttributedString.setTextGray(sectionType.title, fontSize: 14)
            
        }
        return cell
        
    }
    
    func getAbbreviatedPosition(from position: Int) -> String {
        let suffix: String
        let lastTwoDigits = position % 100
        let lastDigit = position % 10
        
        switch lastTwoDigits {
        case 11, 12, 13:
            suffix = "th"
        default:
            switch lastDigit {
            case 1:
                suffix = "st"
            case 2:
                suffix = "nd"
            case 3:
                suffix = "rd"
            default:
                suffix = "th"
            }
        }
        
        return "\(position)\(suffix)"
    }
    
}

/*class HeaderCollectionCell: UICollectionViewCell {
 
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
 
 imageLocation.image = UIImage(systemName: "mappin.and.ellipse")
 imageLocation.tintColor = .black
 
 teamLabel.text = "Red Bull Racing"
 teamLabel.font = UIFont.customFontSubtitle(ofSize: 14)
 
 stackView.axis = .vertical
 stackView.spacing = 10
 
 separator.backgroundColor = .black
 
 }
 
 private func constraint() {
 
 stackView.addArrangedSubviews(nameLabel, teamLabel)
 addSubviews(stackView, imageDriver)
 
 
 for views in [stackView, imageDriver] {
 views.translatesAutoresizingMaskIntoConstraints = false
 }
 
 NSLayoutConstraint.activate([
 
 stackView.centerYAnchor.constraint(equalTo: imageDriver.centerYAnchor),
 stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
 
 imageDriver.heightAnchor.constraint(equalToConstant: 100),
 imageDriver.widthAnchor.constraint(equalToConstant: 100),
 imageDriver.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)
 
 
 
 ])
 
 }
 
 }*/


struct DriverDetailController_Previews: UIViewControllerRepresentable {
    typealias UIViewControllerType = DriverDetailController
    
    func makeUIViewController(context: Context) -> DriverDetailController {
        DriverDetailController(driverId: 24)
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



