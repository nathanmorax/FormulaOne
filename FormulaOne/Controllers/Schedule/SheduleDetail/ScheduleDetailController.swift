//
//  ScheduleDetailController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 07/04/24.
//

import UIKit

class ScheduleDetailController: UICollectionViewController {
   
   fileprivate let circuitId: Int
   fileprivate let competitionId: Int
   
   private let stack = UIStackView()
   lazy var circuitAbout = [CircuitR]()
   lazy var scheduleCompetition = [Response]()
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
      //collectionView.register(Header.self, forSupplementaryViewOfKind: ScheduleDetailController.scheduleHeaderId, withReuseIdentifier: headerId)
      
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
      APIService.shared.fetchScheduleCompetition(idCompetition: competitionId) {[weak self] result,  error in
         guard let result, error == nil else { return }
         self?.scheduleCompetition = result.response ?? []
         
         DispatchQueue.main.async {
            self?.collectionView.reloadData()
         }
      }
      
      
      
      APIService.shared.fetchCircuitAbout(idCircuit: circuitId) {[weak self] result , error  in
         guard let result, error == nil else { return }
         
         self?.circuitAbout = result.response ?? []

         DispatchQueue.main.async {
            self?.collectionView.reloadData()
         }
      }
      
   }
   
   static func createLayout() -> UICollectionViewCompositionalLayout {
      
      return UICollectionViewCompositionalLayout { (sectionNumber, env) ->
         NSCollectionLayoutSection? in
         
         if sectionNumber == 0 {
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            
            item.contentInsets.trailing = 8
            item.contentInsets.leading = 8
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            
            return section
         } else if sectionNumber == 1{
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(90)))
            item.contentInsets.trailing = 8
            
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.top = 14
            section.contentInsets.leading = 8
            section.orthogonalScrollingBehavior = .paging
            /*section.boundarySupplementaryItems = [
               .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: scheduleHeaderId, alignment: .topLeading)
            ]*/
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
   
   private func configureNavigationItem() {
      
      let customButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissVC))
      customButton.setCustomFont(size: 20)
      navigationItem.rightBarButtonItem = customButton
   }
   
   @objc func dismissVC() {
      dismiss(animated: true)
   }
   
   /*override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    if kind == UICollectionView.elementKindSectionHeader {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
    
    if let header = header as? Header {
    header.headerLabel.text = sectionTitles[indexPath.section]
    }
    
    return header
    }
    
    return UICollectionReusableView()
    
    }*/
   
   override func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 3
   }
   
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
      switch section {
      case 0: return 1
      case 1: return scheduleCompetition.count
      default: return 1
      }
   }
   
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      if indexPath.section == 0 {
         guard let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleDetailHeaderCell.scheduleHeaderId, for: indexPath) as? ScheduleDetailHeaderCell else { fatalError("Error al configurar la celda tipo") }
         
         headerCell.circuitLabel.text = sheduleDetail?.circuit?.name
         headerCell.countryLabel.text = sheduleDetail?.competition?.location?.country
         headerCell.cityLabel.text = sheduleDetail?.competition?.location?.city
         
         return headerCell
      } else if indexPath.section == 1 {
         
         guard let schedule = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleDetailCell.scheduleDetailId, for: indexPath) as? ScheduleDetailCell else { fatalError("Error al configurar la celda tipo") }
         
         if indexPath.item < scheduleCompetition.count {
            let scheduleData = scheduleCompetition[indexPath.item]
            schedule.dateLabel.attributedText = NSAttributedString.setTextBold( formatterDate.convertDateFormat(inputDate: scheduleData.date ?? ""), fontSize: 18)
           
         }
         
         return schedule
      } else {
         guard let scheduleAbout = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleAboutCell.circuitAboutId, for: indexPath) as? ScheduleAboutCell else { fatalError("Error al configurar la celda tipo") }
         
         if indexPath.item < circuitAbout.count {
            let scheduleAboutData = circuitAbout[indexPath.item]

            scheduleAbout.configure(with: scheduleAboutData)
         }
         return scheduleAbout
      }
      
   }
   
}

class Header: UICollectionReusableView {
   
   var headerLabel = UILabel()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
      constraint()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   private func configure() {
      headerLabel.font = UIFont.customFontTitle(ofSize: 12)
      
   }
   
   private func constraint() {
      
      addSubview(headerLabel)
      headerLabel.frame = bounds
      
   }
   
}
