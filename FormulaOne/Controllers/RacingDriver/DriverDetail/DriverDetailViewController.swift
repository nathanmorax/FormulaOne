//
//  DriverDetailViewController.swift
//  FormulaOne
//
//  Created by Nathan Mora on 09/04/24.
//

import UIKit

struct SheduleDetail {
   let position: String
   let name: String
   let team: String
   let points: String
}

var shedule = [SheduleDetail(position: "1", name: "Max Verstappen", team: "Red Bull Racing", points: "77"),
               SheduleDetail(position: "2", name: "Sergio Perez", team: "Red Bull Racing", points: "64"),
               SheduleDetail(position: "3", name: "Charles Leclerc", team: "Ferrari", points: "59"),
               SheduleDetail(position: "4", name: "Carlos Sainz", team: "Ferrai", points: "55"),
               SheduleDetail(position: "5", name: "Lando Norris", team: "Mclaren", points: "37"),
               SheduleDetail(position: "6", name: "Oscar Piastri", team: "Mclaren", points: "32"),
               SheduleDetail(position: "7", name: "George Russell", team: "Mercedes", points: "24"),
               SheduleDetail(position: "8", name: "Fernando Alonso", team: "Aston Martin", points: "24"),
               SheduleDetail(position: "9", name: "Lewis Hamilton", team: "Mercedes", points: "10")]



class DriverDetailViewController: BaseCollectionView, UICollectionViewDelegateFlowLayout {
   
   var detailDriver: Response?
   var dri = [Response]()
   fileprivate var driverDetailCell = "cell"
   private var driverId: Int
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configure()
      constraint()
      fetchData()
      
   }
   init(driverId: Int) {
      self.driverId = driverId
      super.init()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   private func configure() {
      
      view.backgroundColor = .brown
      
      collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: driverDetailCell)
      collectionView.delegate = self
      collectionView.dataSource = self
      
   }
   
   private func constraint() {
      view.addSubview(collectionView)
      self.collectionView = collectionView
      
      collectionView?.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          view.topAnchor.constraint(equalTo: collectionView.topAnchor),
          view.leftAnchor.constraint(equalTo: collectionView.leftAnchor),
          view.rightAnchor.constraint(equalTo: collectionView.rightAnchor),
          view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
      ])
      
   }
   
   private func fetchData() {
      APIService.shared.fetchDriver(driverId: driverId) {[weak self] result, error in
         guard let result, error == nil else { return }
         let data = result.response?.first
         detailDriver = data
         print(self?.detailDriver.forEach({ re in
            re.driver?.name
         }))
         DispatchQueue.main.async {
            self?.collectionView.reloadData()
         }
      }
   }
   
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 3
   }
   
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: driverDetailCell, for: indexPath)
      print("///-------------------////")
      print(detailDriver?.driver?.name)
      /*print(detailDriver[indexPath.item].abbr)
      print(detailDriver[indexPath.item].nationality)
      print(detailDriver[indexPath.item].podiums)
      print(detailDriver[indexPath.item].birthplace)*/
      return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return .init(width: view.frame.width - 50, height: 90)
   }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 22
   }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return .init(top: 8, left: 0, bottom: 8, right: 0)
   }
   
   
}
