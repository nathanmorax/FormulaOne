//
//  ScheduleViewController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class ScheduleViewController: BaseCollectionView, UICollectionViewDelegateFlowLayout {
    
    fileprivate var sheduleCell = "cell"
    var schedule = [Response]()
    let formatterDate = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchDataScheduleRace()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        /*guard let url = URL(string: "https://v1.formula-1.api-sports.io/races?season=2024&competition=2") else { return }
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
    
    func configureCollectionView() {
        view.backgroundColor = .lightGray
        let cellNib = UINib(nibName: "ScheduleCollectionCell", bundle: nil)
        collectionView.register(cellNib.self, forCellWithReuseIdentifier: "scheduleCell")
        collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: sheduleCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        //self.collectionView = collectionView
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            view.leftAnchor.constraint(equalTo: collectionView.leftAnchor),
            view.rightAnchor.constraint(equalTo: collectionView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
        ])
    }
    
    func fetchDataScheduleRace() {
        APIService().fetchScheduleRace { result, error in
            guard let result, error == nil else { return }
            
            self.schedule = result.response ?? []
            print("DATAAAA: ", self.schedule.count)
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        schedule.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sheduleCell, for: indexPath)
        if let cell = cell as? ScheduleCell {
            cell.nameCircuitLabel.text = schedule[indexPath.item].circuit?.name
            cell.locationCircuitLabel.text = schedule[indexPath.item].competition?.location?.country
            cell.dateLabel.text = formatterDate.convertDateFormat(inputDate: schedule[indexPath.item].date ?? "")
        }
        cell.layer.cornerRadius = 8
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*let appId = schedule[indexPath.item].competition?.id
        print("Competition Id: ", appId)
        //let viewController = SheduleDetailViewController()
        viewController.appId = appId
        //viewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(viewController, animated: true)
        //self.present(viewController, animated: true, completion: nil)
        viewController.navigationItem.title = schedule[indexPath.row].circuit?.name
        self.tabBarController?.tabBar.isHidden = true*/
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 50, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 8, left: 0, bottom: 8, right: 0)
    }
}

