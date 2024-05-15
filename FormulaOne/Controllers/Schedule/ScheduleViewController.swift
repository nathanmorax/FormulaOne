//
//  ScheduleViewController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class ScheduleViewController: BaseCollectionView, UICollectionViewDelegateFlowLayout {
   
   var schedule = [Response]()
   let formatterDate = String()
   
   struct mockData {
      let image: UIImage
      let circuit: String
      let city: String
      let date: String
   }
   
   var mock = [
      mockData(image: UIImage(named: "Bahrain") ?? UIImage(), circuit: "JEDDAH CORNICHE CIRCUIT", city: "BAHRAIN", date: "mar. 2, 9:00 am"),
      mockData(image: UIImage(named: "Bahrain") ?? UIImage(), circuit: "JEDDAH CORNICHE CIRCUIT", city: "BAHRAIN", date: "mar. 2, 9:00 am"),
      mockData(image: UIImage(named: "Bahrain") ?? UIImage(), circuit: "JEDDAH CORNICHE CIRCUIT", city: "BAHRAIN", date: "mar. 2, 9:00 am"),
      mockData(image: UIImage(named: "Bahrain") ?? UIImage(), circuit: "JEDDAH CORNICHE CIRCUIT", city: "BAHRAIN", date: "mar. 2, 9:00 am"),
      mockData(image: UIImage(named: "Bahrain") ?? UIImage(), circuit: "JEDDAH CORNICHE CIRCUIT", city: "BAHRAIN", date: "mar. 2, 9:00 am"),
      mockData(image: UIImage(named: "Bahrain") ?? UIImage(), circuit: "JEDDAH CORNICHE CIRCUIT", city: "BAHRAIN", date: "mar. 2, 9:00 am"),
      mockData(image: UIImage(named: "Bahrain") ?? UIImage(), circuit: "JEDDAH CORNICHE CIRCUIT", city: "BAHRAIN", date: "mar. 2, 9:00 am"),
      mockData(image: UIImage(named: "Bahrain") ?? UIImage(), circuit: "JEDDAH CORNICHE CIRCUIT", city: "BAHRAIN", date: "mar. 2, 9:00 am"),
   ]
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupCustomNavigationBar()
      configure()
      constraint()
      fetchDataScheduleRace()
      
      let now = Date()
      let calendar = Calendar.current
      let year = calendar.component(.year, from: now)
      
      
      /*guard let url = URL(string:  "https://v1.formula-1.api-sports.io/circuits?id=19") else { return }
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
       
       }.resume()
      
      for familyName in UIFont.familyNames.sorted() {
         print(familyName)
         let fontNames  = UIFont.fontNames(forFamilyName: familyName)
         print("--- \(fontNames)")
      }*/
      
   }
   
   override func viewDidAppear(_ animated: Bool) {
      self.tabBarController?.tabBar.isHidden = false
   }
   
   private func configure() {
      
      view.backgroundColor = .secondarySystemBackground
      
      collectionView.backgroundColor = .clear
      collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: ScheduleCell.reuseID)
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
         
         DispatchQueue.main.async {
            self?.collectionView?.reloadData()
         }
      }
   }
   
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      schedule.count
   }
   
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleCell.reuseID, for: indexPath)
      if let cell = cell as? ScheduleCell {
         
         
         /*cell.countryImage.image = mock[indexPath.item].image
          cell.nameCircuitLabel.text = mock[indexPath.item].circuit
          cell.locationCircuitLabel.text = mock[indexPath.item].city
          cell.dateLabel.text = mock[indexPath.item].date*/
         
         if let countryImage = CountryImage(rawValue: schedule[indexPath.item].competition?.location?.country ?? "") {
            cell.countryImage.image = UIImage(named: countryImage.rawValue)
            let uppercasedText = schedule[indexPath.item].competition?.location?.country
            cell.locationCircuitLabel.text = uppercasedText?.uppercased()
            cell.nameCircuitLabel.text = schedule[indexPath.item].circuit?.name
            cell.dateLabel.text = formatterDate.convertDateFormat(inputDate: schedule[indexPath.item].date ?? "")
         } else { cell.countryImage.image = UIImage(systemName: "flag f1") }
         
      }
      cell.layer.cornerRadius = 9
      return cell
   }
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
      guard indexPath.item < schedule.count else {
          return
      }

      let selectedSchedule = schedule[indexPath.item]
      let competitionId = selectedSchedule.competition?.id ?? 0
      let circuitId = selectedSchedule.circuit?.id ?? 0
      
      let scheduleDetailVC = ScheduleDetailController(circuitId: circuitId, competitionId: competitionId)

      scheduleDetailVC.sheduleDetail = selectedSchedule

      present(UINavigationController(rootViewController: scheduleDetailVC), animated: true)

      
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return .init(width: view.frame.width - 50, height: 100)
   }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 22
   }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return .init(top: 8, left: 0, bottom: 8, right: 0)
   }
}

