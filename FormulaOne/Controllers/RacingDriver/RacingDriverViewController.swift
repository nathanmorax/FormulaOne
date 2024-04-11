//
//  RacingDriverViewController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class RacingDriverViewController: UIViewController  {
   
   
   let tableView = UITableView(frame: .zero, style: .insetGrouped)
   let tableViewcell = "id"
   var driver = [Response]()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configure()
      constraint()
      fetchData()
   }
   
   private func configure() {
      
      navigationController?.navigationBar.prefersLargeTitles = true
      
      tableView.delegate = self
      tableView.dataSource = self
      tableView.estimatedRowHeight = 120
      tableView.rowHeight = UITableView.automaticDimension
      tableView.register(RacingDriverCell.self, forCellReuseIdentifier: tableViewcell)
      
   }
   
   private func constraint() {
      
      view.addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false
      
      tableView.rowHeight = 55
      tableView.estimatedRowHeight = UITableView.automaticDimension
      
      NSLayoutConstraint.activate([
         view.topAnchor.constraint(equalTo: tableView.topAnchor),
         view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
         view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
         view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
      ])
      
   }
   private func fetchData() {
      
      APIService.shared.fetchRankigsDrivers {[weak self] result , error in
         guard let result, error == nil else { return }
         
         self?.driver = result.response ?? []
         print("Driver::", self?.driver.count)
         DispatchQueue.main.async {
            self?.tableView.reloadData()
         }
      }
   }
   
}
extension RacingDriverViewController: UITableViewDelegate, UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return driver.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: tableViewcell, for: indexPath)
      if let cell = cell as? RacingDriverCell {
         
         cell.positionDriverLabel.text = driver[indexPath.row].position?.formatted()
         cell.imageDriver.image = UIImage(named: "Mexico")
         cell.nameDriverLabel.text = driver[indexPath.row].driver?.name
         cell.teamLabel.text = driver[indexPath.row].team?.name
         cell.pointsDriverLabel.text = driver[indexPath.row].points?.formatted()
         
      }
      return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("Indexxx:", indexPath)
      
      let driverId = driver[indexPath.item].driver?.id ?? 0
      let viewController = DriverDetailViewController(driverId: driverId)
      navigationController?.pushViewController(viewController, animated: true)
   }
   
}

