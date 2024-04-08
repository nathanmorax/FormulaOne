//
//  ScheduleDetailViewController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class ScheduleDetailViewController: BaseCollectionView, UICollectionViewDelegateFlowLayout {
    
    fileprivate let sheduleDetailCell = "cell"
    fileprivate let competitionId: Int
    private let stack = UIStackView()
    lazy var sheduleCompetition = [Response]()
    let formatterDate = String()

    
    init(competitionId: Int) {
        self.competitionId = competitionId
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        constraint()
        fetchData()
    }
    
    private func configure() {
        
        view.backgroundColor = .lightGray
        
        collectionView.register(ScheduleDetailCell.self, forCellWithReuseIdentifier: sheduleDetailCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        /*if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }*/
    }
    
    private func constraint() {
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
        ])
    }
    
    private func fetchData() {
        APIService.shared.fetchScheduleCompetition(idCompetition: competitionId) {[weak self] result,  error in
            guard let result, error == nil else { return }
            self?.sheduleCompetition = result.response ?? []
            
            print("Dattos:", self?.sheduleCompetition.count)
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sheduleCompetition.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sheduleDetailCell, for: indexPath)
        if let cell = cell as? ScheduleDetailCell {
            cell.typeRaceLabel.text = sheduleCompetition[indexPath.item].type?.rawValue
            cell.dateLabel.text = formatterDate.convertDateFormat(inputDate: sheduleCompetition[indexPath.item].date ?? "")
            cell.statusLabel.text = sheduleCompetition[indexPath.item].status?.rawValue
            //cell.imageView.image =  UIImage(systemName: "rectangle.checkered")
        }
        cell.backgroundColor = .secondarySystemBackground
        cell.layer.cornerRadius = 8
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 40, height: 60)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}