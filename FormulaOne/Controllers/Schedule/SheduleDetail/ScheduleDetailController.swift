//
//  ScheduleDetailController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 07/04/24.
//

import UIKit
import SwiftUI

class ScheduleDetailController: UICollectionViewController {
    
    static let ScheduleDetailHeaderId = "ScheduleDetailHeaderId"
    
    fileprivate let circuitId: Int
    fileprivate let competitionId: Int
    lazy var circuitAbout = [CircuitR]()
    lazy var scheduleCompetition = [Response]()
    private let stack = UIStackView()
    var sheduleDetail: Response?
    let formatterDate = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavigationItem()
        constraint()
        fetchData()
        
    }
    
    init(circuitId: Int, competitionId: Int) {
        self.circuitId = circuitId
        self.competitionId = competitionId
        super.init(collectionViewLayout: ScheduleDetailController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        collectionView.register(ScheduleDetailHeaderCell.self, forCellWithReuseIdentifier: ScheduleDetailHeaderCell.scheduleHeaderId)
        collectionView.register(ScheduleDetailCell.self, forCellWithReuseIdentifier: ScheduleDetailCell.scheduleDetailId)
        collectionView.register(ScheduleAboutCell.self, forCellWithReuseIdentifier: ScheduleAboutCell.circuitAboutId)
        collectionView.register(ScheduleFastestLapCell.self, forCellWithReuseIdentifier: ScheduleFastestLapCell.fastestLapId)
        collectionView.register(ReusableHeaderView.self, forSupplementaryViewOfKind: ScheduleDetailController.ScheduleDetailHeaderId, withReuseIdentifier: ReusableHeaderView.headerId)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.layer.borderColor = UIColor.black.cgColor
        collectionView.layer.borderWidth = 1
        
        
    }
    
    private func constraint() {
        
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func fetchData() {
        
        let dispathGroup = DispatchGroup()
        dispathGroup.enter()
        
        APIService.shared.fetchScheduleCompetition(idCompetition: competitionId) {[weak self] result,  error in
            guard let result, error == nil else { return }
            self?.scheduleCompetition = result.response ?? []
            // MARK: - Ordenamiento del calendario
            /*self?.scheduleCompetition.sort { event1, event2 in
             let desiredOrder: [TypeEnum] = [.the1StPractice, .the2NdPractice, .the3RDPractice, .the1StQualifying, .the2NdQualifying, .the3RDQualifying, .race]
             guard let index1 = desiredOrder.firstIndex(of: event1.type ?? .race),
             let index2 = desiredOrder.firstIndex(of: event2.type ?? .race) else {
             return false
             }
             return index1 < index2
             }*/
            dispathGroup.leave()
        }
        
        dispathGroup.enter()
        APIService.shared.fetchCircuitAbout(idCircuit: circuitId) {[weak self] result , error  in
            guard let result, error == nil else { return }
            self?.circuitAbout = result.response ?? []
            
            dispathGroup.leave()
            
        }
        dispathGroup.notify(queue: .main) {
            self.collectionView.reloadData()
        }
        
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection? in
            
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),
                elementKind: ScheduleDetailController.ScheduleDetailHeaderId, alignment: .top
            )
            
            headerItem.pinToVisibleBounds = true
            headerItem.contentInsets.leading = 12
            
            guard let section = Section(rawValue: sectionIndex) else {
                return nil
            }
            
            switch section {
            case .header:
                return NSCollectionLayoutSection.sideOneItem(headerItem: headerItem)
            case .schedule:
                return NSCollectionLayoutSection.sideScrollingOneItem(headerItem: headerItem)
            case .about:
                return NSCollectionLayoutSection.stackViewWithSixItems(headerItem: headerItem)
            case .fastestLap:
                return NSCollectionLayoutSection.sideOneItem(headerItem: headerItem)
            }
        }
    }

    
    private func configureNavigationItem() {
        
        let customButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissVC))
        customButton.setCustomFont(size: 20)
        navigationItem.rightBarButtonItem = customButton
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let sectionType = Section(rawValue: section) else { return 0 }
        
        switch sectionType {
        case .header: return 1
        case .schedule: return scheduleCompetition.count
        case .about: return 1
        case .fastestLap: return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionType = Section(rawValue: indexPath.section)
        
        switch sectionType {
        case .header:
            guard let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleDetailHeaderCell.scheduleHeaderId, for: indexPath) as? ScheduleDetailHeaderCell else { fatalError("Error al configurar la celda tipo") }
            
            headerCell.circuitLabel.text = sheduleDetail?.circuit?.name
            print("Namee>>>>>", sheduleDetail?.circuit?.name)
            headerCell.countryLabel.text = sheduleDetail?.competition?.location?.country
            headerCell.cityLabel.text = sheduleDetail?.competition?.location?.city
            
            return headerCell
        case .schedule:
            guard let schedule = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleDetailCell.scheduleDetailId, for: indexPath) as? ScheduleDetailCell else { fatalError("Error al configurar la celda tipo") }
            //MARK: - Arreglar el porque no pinta las fechas, si la respuesta si las trae
            if indexPath.item < scheduleCompetition.count {
                let scheduleData = scheduleCompetition[indexPath.item].date
                schedule.dateLabel.attributedText = NSAttributedString.setTextBold( formatterDate.convertDateFormat(inputDate: scheduleData ?? "") ?? "Des", fontSize: 18)
                
                
            }
            return schedule
            
        case .about:
            guard let scheduleAbout = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleAboutCell.circuitAboutId, for: indexPath) as? ScheduleAboutCell else { fatalError("Error al configurar la celda tipo") }
            
            if indexPath.item < circuitAbout.count {
                let scheduleAboutData = circuitAbout[indexPath.item]
                scheduleAbout.configure(with: scheduleAboutData)
            }
            return scheduleAbout
            
        case .fastestLap:
            guard let fastestLap = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleFastestLapCell.fastestLapId, for: indexPath) as? ScheduleFastestLapCell else { fatalError("Error al configurar la celda tipo") }
            if indexPath.item < circuitAbout.count {
                let fastestLapAboutData = circuitAbout[indexPath.item]
                fastestLap.configure(with: fastestLapAboutData)
            }
            return fastestLap
        case .none:
            return UICollectionViewCell()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ReusableHeaderView.headerId, for: indexPath) as? ReusableHeaderView else { fatalError("Error al configurar la celda tipo") }
        
        if let sectionType = Section(rawValue: indexPath.section) {
            cell.titleLabel.attributedText = NSAttributedString.setTextGray(sectionType.title, fontSize: 14)
            
        }
        return cell
        
    }
    
}

struct DetailController_Previews: UIViewControllerRepresentable {
    typealias UIViewControllerType = ScheduleDetailController
    
    func makeUIViewController(context: Context) -> ScheduleDetailController {
        ScheduleDetailController(circuitId: 19, competitionId: 1)
    }
    
    func updateUIViewController(_ uiViewController: ScheduleDetailController, context: Context) {
    }
    
    
}

struct ViewControllers_Previews: PreviewProvider {
    static var previews: some View {
        DetailController_Previews()
            .edgesIgnoringSafeArea(.all)
    }
}


