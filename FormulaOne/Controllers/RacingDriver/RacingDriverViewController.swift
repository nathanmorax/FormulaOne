//
//  RacingDriverViewController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

struct SheduleDetail {
    let typeRace: String
    let date: String
    let status: String
}

var shedule = [SheduleDetail(typeRace: "Race", date: "2024-03-02T15:00:00+00:00", status: "Completed"),
               SheduleDetail(typeRace: "1st Qualifying", date: "2024-03-01T16:00:00+00:00", status: "Completed"),
               SheduleDetail(typeRace: "2nd Qualifying", date: "2024-03-01T16:22:00+00:00", status: "Completed"),
               SheduleDetail(typeRace: "Race", date: "2024-03-02T15:00:00+00:00", status: "Completed"),
               SheduleDetail(typeRace: "1st Qualifying", date: "2024-03-01T16:00:00+00:00", status: "Completed"),
               SheduleDetail(typeRace: "2nd Qualifying", date: "2024-03-01T16:22:00+00:00", status: "Completed")]



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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(RacingDriverCell.self, forCellReuseIdentifier: tableViewcell)
        
    }

    private func constraint() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
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
        return shedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewcell, for: indexPath)
        if let cell = cell as? RacingDriverCell {
            /*cell.positionDriverLabel.text = driver[indexPath.row].position?.formatted()
            cell.nameDriverLabel.text = driver[indexPath.row].driver?.name
            cell.nameTeamLabel.text = driver[indexPath.row].team?.name
            cell.pointsDriverLabel.text = driver[indexPath.row].points?.formatted()*/
            
            cell.nameDriverLabel.text = shedule[indexPath.row].typeRace
            cell.nameTeamLabel.text = shedule[indexPath.row].date
            cell.pointsDriverLabel.text = shedule[indexPath.row].status

        }
        return cell
    }
    
}

