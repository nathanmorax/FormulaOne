//
//  Schedule.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import Foundation

// MARK: A mark comment lives here.

// MARK: - Welcome
struct ServiceResponse: Decodable {
   let welcomeGet: String?
   let parameters: Parameters?
   let results: Int?
   let response: [Response]?
   
   enum CodingKeys: String, CodingKey {
      case welcomeGet = "get"
      case parameters, results, response
   }
}

// MARK: - Parameters
struct Parameters: Decodable {
   let id, season, type: String?
}

// MARK: - Response
struct Response: Decodable {
   let id: Int?
   let competition: Competition?
   let circuit: Circuit?
   let season: Int?
   let type: TypeEnum?
   let laps: Laps?
   let fastestLap: FastestLap?
   let distance: String?
   let timezone: Timezone?
   let date: String?
   let status: Status?
   let position: Int?
   let driver: Driver?
   //let drivers: Drivers?
   let team: Team?
   let points: Int?
   let wins: Int?
   let behind: Int?
   
}

// MARK: - Circuit
struct Circuit: Decodable {
   let id: Int?
   let name: String?
   let image: String?
}

// MARK: - Competition
struct Competition: Decodable {
   let id: Int?
   let name: String?
   let location: Location?
}

// MARK: - Location
struct Location: Decodable {
   let country, city: String?
}

// MARK: - FastestLap
struct FastestLap: Decodable {
   //let time: JSONNull?
}
// MARK: - Driver
struct Driver: Decodable {
   
   let id: Int?
   let name: String?
   let abbr: String?
   let number: Int?
   let image: String?
   

   let nationality: String?
   let country: Country?
   let birthdate, birthplace: String?
   let grandsPrixEntered, worldChampionships, podiums: Int?
   let highestRaceFinish: HighestRaceFinish?
   let highestGridPosition: Int?
   let careerPoints: String?
   let teams: [TeamElement]?

   enum CodingKeys: String, CodingKey {
       case id, name, abbr, image, nationality, country, birthdate, birthplace, number
       case grandsPrixEntered = "grands_prix_entered"
       case worldChampionships = "world_championships"
       case podiums
       case highestRaceFinish = "highest_race_finish"
       case highestGridPosition = "highest_grid_position"
       case careerPoints = "career_points"
       case teams
   }
   
}

// MARK: - Country
struct Country: Decodable {
    let name, code: String?
}

// MARK: - HighestRaceFinish
struct HighestRaceFinish: Decodable {
    let position, number: Int?
}

// MARK: - TeamElement
struct TeamElement: Decodable {
    let season: Int?
    let team: TeamTeam?
}

// MARK: - TeamTeam
struct TeamTeam: Decodable {
    let id: Int?
    let name: String?
    let logo: String?
}



// MARK: - Team
struct Team: Decodable {
   let id: Int?
   let name: String?
   let logo: String?
}

// MARK: - Laps
struct Laps: Decodable {
   //let current: JSONNull?
   let total: Int?
}

enum Status: String, Decodable {
   case canceled = "Canceled"
   case scheduled = "Scheduled"
   case completed = "Completed"
   case live = "Live"
}

enum Timezone: String, Decodable {
   case utc = "utc"
}

enum TypeEnum: String, Decodable {
   case race = "Race"
   case sprint = "Sprint"
   case the1StPractice = "1st Practice"
   case the1StQualifying = "1st Qualifying"
   case the1StSprintShootout = "1st Sprint Shootout"
   case the2NdPractice = "2nd Practice"
   case the2NdQualifying = "2nd Qualifying"
   case the2NdSprintShootout = "2nd Sprint Shootout"
   case the3RDPractice = "3rd Practice"
   case the3RDQualifying = "3rd Qualifying"
   case the3RDSprintShootout = "3rd Sprint Shootout"
}


enum CountryImage: String {
   case mx = "Mexico"
   case it = "Italy"
   case nl = "Netherlands"
   case at = "Austria"
   case au = "Australia"
   case az = "Azerbaijan"
   case bh = "Bahrain"
   case be = "Belgium"
   case br = "Brazil"
   case ca = "Canada"
   case cn = "China"
   case hu = "Hungary"
   case jp = "Japan"
   case mc = "Monaco"
   case qa = "Qatar"
   case sa = "Saudi Arabia"
   case sg = "Singapore"
   case es = "Spain"
   case ae = "United Arab Emirates"
   case gb = "United Kingdom"
   case usa = "USA"
   
}
