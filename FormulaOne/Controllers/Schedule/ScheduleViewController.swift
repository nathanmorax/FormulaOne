//
//  ScheduleViewController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class ScheduleViewController: BaseCollectionView, UICollectionViewDelegateFlowLayout {
    
    fileprivate var sheduleCell = "cell"
    let viewErrorAPI = UIView()
    let labelEror = UILabel()
    var schedule = [Response]()
    let formatterDate = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        constraint()
        fetchDataScheduleRace()
        
        let now = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: now)
        
        print("year Current: ", year)
        
        /*guard let url = URL(string: "https://v1.formula-1.api-sports.io/rankings/drivers?season=2024") else { return }
         //https://v1.formula-1.api-sports.io/races?season=2024&competition=2
         //"https://v1.formula-1.api-sports.io/races?competition=1&season=2019&type=1st Practice"
         var request = URLRequest(url: url)
         
         request.setValue("0b7e6ef1cb0f427b725840048b514534", forHTTPHeaderField: "x-rapidapi-key")
         
         URLSession.shared.dataTask(with: request) { (data, response, error) in
         guard let data, error == nil else {
         //completion(nil, error)
         return
         }
         do {
         print("data es esta madreee", String(decoding: data, as: UTF8.self))
         //let objects = try JSONDecoder().decode(T.self, from: data)
         //completion(objects, nil)
         } catch {
         print("decoding error:", error)
         //completion(nil, error)
         }
         
         }.resume()*/
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func configure() {
        
        navigationController?.navigationBar.prefersLargeTitles = true

        
        view.backgroundColor = .lightGray
        
        collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: sheduleCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
    
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
    
    private func fetchDataScheduleRace() {
        APIService().fetchScheduleRace {[weak self] result, error in
            guard let result, error == nil else { return }
            
            self?.schedule = result.response ?? []
            print("DATAAAA: ", self?.schedule.count)
    
            DispatchQueue.main.async {
                self?.collectionView?.reloadData()
            }
        }
    }
    
    /*func presentSheetSheduleDetail() {
        let viewController = ScheduleDetailViewController()
        //viewController.modalPresentationStyle = .fullScreen
        
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
        }
        //self.navigationController?.pushViewController(viewController, animated: true)
        self.present(viewController, animated: true, completion: nil)
    }*/
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        schedule.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sheduleCell, for: indexPath)
        if let cell = cell as? ScheduleCell {
            if let countryImage = CountryImage(rawValue: schedule[indexPath.item].competition?.location?.country ?? "") {
                cell.countryImage.image = UIImage(named: countryImage.rawValue)
                cell.locationCircuitLabel.text = schedule[indexPath.item].competition?.location?.country
                cell.nameCircuitLabel.text = schedule[indexPath.item].circuit?.name
                cell.dateLabel.text = formatterDate.convertDateFormat(inputDate: schedule[indexPath.item].date ?? "")
            } else { cell.countryImage.image = UIImage(systemName: "flag f1") }
           
            
        }
        cell.layer.cornerRadius = 8
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let competitionId = schedule[indexPath.item].competition?.id ?? 0
        let sheduleDetail = ScheduleDetailController(competitionId: competitionId)
        
        if let sheet = sheduleDetail.sheetPresentationController {
            sheet.detents = [ .custom { _ in return 500 }]
            sheet.preferredCornerRadius = 10
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
        }
        //self.navigationController?.pushViewController(viewController, animated: true)
        self.present(sheduleDetail, animated: true, completion: nil)
        
       // presentSheetSheduleDetail()
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

