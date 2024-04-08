//
//  ScheduleDetailController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 07/04/24.
//

import UIKit

class ScheduleDetailController: UIViewController {
    
    fileprivate let sheduleDetailCell = "cell"
    fileprivate let headerCell = "headerCell"
    fileprivate let competitionId: Int
    private let stack = UIStackView()
    lazy var sheduleCompetition = [Response]()
    var shedule: Response?

    let formatterDate = String()
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        constraint()
        fetchData()
        
    }
    
    init(competitionId: Int) {
        self.competitionId = competitionId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        view.backgroundColor = .lightGray
        
        tableView.register(ScheduleDetailCell.self, forCellReuseIdentifier: sheduleDetailCell)
        tableView.register(ScheduleDetailHeaderCell.self, forCellReuseIdentifier: headerCell)
        
        tableView.rowHeight = 55
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        
        /*if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
         layout.scrollDirection = .horizontal
         }*/
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
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
        ])
    }
    
    private func fetchData() {
        APIService.shared.fetchScheduleCompetition(idCompetition: competitionId) {[weak self] result,  error in
            guard let result, error == nil else { return }
            self?.sheduleCompetition = result.response ?? []
            self?.shedule = result.response?.first
            
            print("Dattos:", self?.sheduleCompetition.count)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension ScheduleDetailController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if section == 0 {
            return 1
        } else {
            return sheduleCompetition.count

        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: headerCell, for: indexPath) as? ScheduleDetailHeaderCell else { return UITableViewCell() }
            
            headerCell.countryLabel.text = shedule?.competition?.location?.country
            headerCell.lenghtLabel.text = shedule?.distance
            headerCell.nameCircuitLabel.text = shedule?.circuit?.name
            return headerCell
            
        } else if indexPath.section == 1 {
            guard let scheduleCell = tableView.dequeueReusableCell(withIdentifier: sheduleDetailCell, for: indexPath) as? ScheduleDetailCell else { return UITableViewCell() }
            
            scheduleCell.typeRaceLabel.text = sheduleCompetition[indexPath.item].type?.rawValue
            scheduleCell.dateLabel.text = formatterDate.convertDateFormat(inputDate: sheduleCompetition[indexPath.item].date ?? "")
            scheduleCell.statusLabel.text = sheduleCompetition[indexPath.item].status?.rawValue
            return scheduleCell
        }
        
        /*let cell = tableView.dequeueReusableCell(withIdentifier: sheduleDetailCell, for: indexPath)
        if let cell = cell as? ScheduleDetailCell {
            cell.typeRaceLabel.text = sheduleCompetition[indexPath.item].type?.rawValue
            cell.dateLabel.text = formatterDate.convertDateFormat(inputDate: sheduleCompetition[indexPath.item].date ?? "")
            cell.statusLabel.text = sheduleCompetition[indexPath.item].status?.rawValue
            //cell..image =  UIImage(systemName: "rectangle.checkered")
            //cell.textLabel?.text = sheduleCompetition[indexPath.row].type?.rawValue
            print( "Section 1: ", sheduleCompetition[indexPath.item].type?.rawValue)
            
        }
        cell.backgroundColor = .secondarySystemBackground
        //cell.layer.cornerRadius = 8
        
        return cell*/
        
        return UITableViewCell()
        
    }
    
}
