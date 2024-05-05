//
//  TeamsViewController.swift
//  FormulaOne
//
//  Created by Nathan Mora on 03/05/24.
//

import UIKit

struct mockData {
   let position: String
   let nameTeam: String
   let points: String
   let image: UIImage?
}

var mock = [
   mockData(position: "1", nameTeam: "Red Bull", points: "209 PTS", image: UIImage(named: "team")),
   mockData(position: "2", nameTeam: "Ferrari", points: "162 PTS", image: UIImage(named: "team")),
   mockData(position: "3", nameTeam: "McLaren", points: "99 PTS", image: UIImage(named: "team")),
   mockData(position: "4", nameTeam: "Mercedes", points: "52 PTS", image: UIImage(named: "team")),
   mockData(position: "5", nameTeam: "Aston Martin", points: "40 PTS", image: UIImage(named: "team")),
   mockData(position: "6", nameTeam: "RB", points: "13 PTS", image: UIImage(named: "team")),
   mockData(position: "7", nameTeam: "Hass", points: "7 PTS", image: UIImage(named: "team")),
   mockData(position: "8", nameTeam: "Willliams", points: "0 PTS", image: UIImage(named: "team")),
   mockData(position: "9", nameTeam: "Alpine", points: "0 PTS", image: UIImage(named: "team")),
   mockData(position: "10", nameTeam: "Sauber", points: "0 PTS", image: UIImage(named: "team"))

   
]

class TeamsViewController: UIViewController {
   
   var tableView = UITableView(frame: .zero)
   let teamsCellId = "teamsCellId"
   var teams = [Response]()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupCustomNavigationBar()
      configure()
      constraint()
      fetchDataRankingsTeams()
   }
   
   private func configure() {
      view.backgroundColor = .secondarySystemBackground
      tableView.backgroundColor = .clear
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(TeamsViewCell.self, forCellReuseIdentifier: teamsCellId)
      
      tableView.rowHeight = 80
      tableView.estimatedRowHeight = UITableView.automaticDimension

   }
   
   private func constraint(){
      
      view.addSubview(tableView)
      
      tableView.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         tableView.topAnchor.constraint(equalTo: view.topAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
      
   }
   
   private func fetchDataRankingsTeams() {
      
      APIService.shared.fetchRankingsTeams {[weak self] result , error in
         guard let result, error == nil else { return  }
         
         self?.teams = result.response  ?? []
         print("Rankings Teams:", self?.teams.count)
         DispatchQueue.main.async {
            self?.tableView.reloadData()
         }
      }
   }
   
}

extension TeamsViewController: UITableViewDataSource, UITableViewDelegate {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      teams.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: teamsCellId, for: indexPath)
      
      if let cell = cell as? TeamsViewCell {
         let isEvenRow = indexPath.row % 2 == 0
         let dataTeams = teams[indexPath.row]
         cell.configure(with: dataTeams, isEvenRow: isEvenRow)
         /*cell.positionLabel.text = mock[indexPath.row].position
         cell.nameTeamLabel.text = mock[indexPath.row].nameTeam
         cell.imageLogo.image = mock[indexPath.row].image
         cell.pointsLabel.text = mock[indexPath.row].points*/
      }
      return cell
   }
   
   
}
