//
//  RacingDriverViewController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class RacingDriverViewController: UIViewController  {
    
    var tableView = UITableView(frame: .zero)
    let tableViewcell = "id"
    var driver = [Response]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomNavigationBar()
        configure()
        constraint()
        fetchData()
    }
    
    private func configure() {
        
        view.backgroundColor = .secondarySystemBackground
        tableView.backgroundColor = .clear
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.rowHeight = 55
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
        
        tableView.register(RacingDriverCell.self, forCellReuseIdentifier: tableViewcell)
        
    }
    
    private func constraint() {
        
        view.addSubview(tableView)
        
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
            
            /*if let color = teamColor.first(where: { $0.name ==
             driver[indexPath.row].team?.name
             })?.color {
             print("COloooor---", color)
             cell.view.backgroundColor = color
             }*/
            let driverData = driver[indexPath.row]
            let isEvenRow = indexPath.row % 2 == 0
            cell.configure(with: driverData, isEvenRow: isEvenRow)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        
        let driverId = driver[indexPath.row].driver?.id ?? 0
        print("ID:: ", driverId)
        let viewController = DriverDetailController(driverId: driverId)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
        //navigationController?.pushViewController(viewController, animated: true)
    }
    
}

