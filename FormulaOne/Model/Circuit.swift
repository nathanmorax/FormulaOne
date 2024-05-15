//
//  Circuit.swift
//  FormulaOne
//
//  Created by Nathan Mora on 13/05/24.
//

struct CircuitResponse: Decodable {
   let welcomeGet: String?
   let parameters: CircuitParameters?
   //let errors: [JSONAny]
   let results: Int?
   let response: [CircuitR]?
   
   enum CodingKeys: String, CodingKey {
      case welcomeGet = "get"
      case parameters , results, response
   }
}

// MARK: - Parameters
struct CircuitParameters: Decodable {
   let id: String?
}

// MARK: - Response
struct CircuitR: Decodable {
   let id: Int
   let name: String
   let image: String
   let competition: CircuitCompetition?
   let firstGrandPrix, laps: Int
   let length, raceDistance: String
   let lapRecord: LapRecord?
   let capacity, opened: Int
   let owner: String?
   
   enum CodingKeys: String, CodingKey {
      case id, name, image, competition
      case firstGrandPrix = "first_grand_prix"
      case laps, length
      case raceDistance = "race_distance"
      case lapRecord = "lap_record"
      case capacity, opened, owner
   }
   
   init(id: Int?, name: String?, image: String?, competition: CircuitCompetition?, firstGrandPrix: Int?, laps: Int?, length: String?, raceDistance: String?, lapRecord: LapRecord?, capacity: Int?, opened: Int?, owner: String?) {
      self.id = id ?? 0
      self.name = name ?? ""
      self.image = image ?? ""
      self.competition = competition
      self.firstGrandPrix = firstGrandPrix ?? 0
      self.laps = laps ?? 0
      self.length = length ?? ""
      self.raceDistance = raceDistance ?? ""
      self.lapRecord = lapRecord
      self.capacity = capacity ?? 0
      self.opened = opened ?? 0
      self.owner = owner
   }
   
}

// MARK: - Competition
struct CircuitCompetition: Decodable {
   let id: Int
   let name: String
   let location: CircuitLocation?
   
   init(id: Int, name: String?, location: CircuitLocation?) {
      self.id = id
      self.name = name ?? ""
      self.location = location
   }
}

// MARK: - Location
struct CircuitLocation: Decodable {
   let country, city: String?
   
   init(country: String?, city: String?) {
      self.country = country ?? ""
      self.city = city ?? ""
   }
}

// MARK: - LapRecord
struct LapRecord: Decodable {
   let time, driver, year: String
   
   init(time: String?, driver: String?, year: String?) {
      self.time = time ?? ""
      self.driver = driver ?? ""
      self.year = year ?? ""
   }
}
