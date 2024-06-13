//
//  DriverDetailViewController.swift
//  FormulaOne
//
//  Created by Nathan Mora on 09/04/24.
//

import UIKit
//import SDWebImage


class DriverDetailViewController: BaseCollectionView, UICollectionViewDelegateFlowLayout {
   
   var racing = RacingDriverViewController()
   
   var detailDriver = [Drivers]()
   fileprivate var driverDetailCell = "cell"
   //private var driverId: Int
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configure()
      constraint()
      //fetchData()
      
      collectionView.backgroundColor = .cyan
      
      
   }
   /*init(driverId: Int) {
    self.driverId = driverId
    super.init()
    }*/
   
   /* required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }*/
   
   private func configure() {
      
      navigationController?.navigationBar.prefersLargeTitles = false
      
      collectionView.register(DriverHeaderCell.self, forCellWithReuseIdentifier: driverDetailCell)
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
   
   /*private func fetchData() {
    
    /*APIService.shared.fetchDriver(driverId: driverId) { result , error in
     guard let result, error == nil else { return }
     
     self.detailDriver = result.response?.first
     print(self.detailDriver?.driver?.name)
     
     DispatchQueue.main.async {
     self.collectionView.reloadData()
     }
     }*/
    
    APIService.shared.fetchDriver(driverId: driverId) { result , error in
    guard let result, error == nil else{ return }
    self.detailDriver = result.response ?? []
    
    DispatchQueue.main.async {
    self.collectionView.reloadData()
    }
    }
    }*/
   
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return detailDriver.count
   }
   
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: driverDetailCell, for: indexPath)
      if let cell = cell as? DriverHeaderCell {
         
         if let color = teamColor.first(where: { $0.name ==
            detailDriver[indexPath.item].teams?[indexPath.item].team?.name
         })?.color {
            cell.backgroundColor = color
         }
         let url = URL(string: detailDriver[indexPath.item].image ?? "")
         //cell.image.sd_setImage(with: url)
         cell.nameLabel.text = detailDriver[indexPath.item].name
         cell.nationalityLabel.text = detailDriver[indexPath.item].nationality
      }
      
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
