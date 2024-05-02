//
//  RacingDriverViewController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class RacingDriverViewController: UIViewController  {
   
   struct mockData {
      let position: String
      let driver: String
      let team: String
      let points: String
   }
   
   var mock = [
      mockData(position: "1", driver: "Alonso", team: "Red BUll", points: "75"),
      mockData(position: "1", driver: "Alonso", team: "Red BUll", points: "75"),
      mockData(position: "1", driver: "Alonso", team: "Red BUll", points: "75"),
      mockData(position: "1", driver: "Alonso", team: "Red BUll", points: "75"),
      mockData(position: "1", driver: "Alonso", team: "Red BUll", points: "75"),
      mockData(position: "1", driver: "Alonso", team: "Red BUll", points: "75"),
      mockData(position: "1", driver: "Alonso", team: "Red BUll", points: "75"),
      mockData(position: "1", driver: "Alonso", team: "Red BUll", points: "75")
      
   ]
   
   var tableView = UITableView(frame: .zero)
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
      
      navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Superstcrea", size: 30)!]
      navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Superstcrea", size: 24)!]
      
      tableView.delegate = self
      tableView.dataSource = self
      tableView.estimatedRowHeight = 120
      tableView.rowHeight = UITableView.automaticDimension
      tableView.register(RacingDriverCell.self, forCellReuseIdentifier: tableViewcell)
      
   }
   
   private func constraint() {
      
      view.addSubview(tableView)
      
      view.backgroundColor = .secondarySystemBackground
      tableView.backgroundColor = .clear
      tableView.translatesAutoresizingMaskIntoConstraints = false
      
      tableView.rowHeight = 55
      tableView.estimatedRowHeight = UITableView.automaticDimension
      
      NSLayoutConstraint.activate([
         tableView.topAnchor.constraint(equalTo: view.topAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         
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
      return mock.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: tableViewcell, for: indexPath)
      if let cell = cell as? RacingDriverCell {
         
         /*if let color = teamColor.first(where: { $0.name ==
          driver[indexPath.row].team?.name
          })?.color {
          print("COloooor---", color)
          cell.view.backgroundColor = color
          }*/
         
         /*cell.positionDriverLabel.text = driver[indexPath.row].position?.formatted()
          cell.nameDriverLabel.text = driver[indexPath.row].driver?.name
          cell.teamLabel.text = driver[indexPath.row].team?.name
          cell.pointsDriverLabel.text = driver[indexPath.row].points?.formatted()*/
         
         let isEvenRow = indexPath.row % 2 == 0
         
         // Configura el color de fondo de la celda
         if isEvenRow {
            cell.contentView.backgroundColor = .secondarySystemBackground
            cell.pointsDriverLabel.backgroundColor = grayRetroColor
         } else {
            cell.contentView.backgroundColor = grayRetroColor
            cell.pointsDriverLabel.backgroundColor = redRetroColor

         }
         
         cell.pointsDriverLabel.text = mock[indexPath.row].points
         cell.positionDriverLabel.text = mock[indexPath.row].position
         cell.nameDriverLabel.text =  mock[indexPath.row].driver
         cell.teamLabel.text = mock[indexPath.row].team
         
      }
      return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("Indexxx:", indexPath)
      
      //let driverId = driver[indexPath.item].driver?.id ?? 0
      let viewController = DriverDetailViewController()
      viewController.modalPresentationStyle = .fullScreen
      present(viewController, animated: true, completion: nil)
      //navigationController?.pushViewController(viewController, animated: true)
   }
   
}

