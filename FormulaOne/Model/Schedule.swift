//
//  Schedule.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

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
    let season: Int
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
// MARK: - Status Laps

enum Status: String, Decodable {
    case canceled = "Canceled"
    case scheduled = "Scheduled"
    case completed = "Completed"
    case live = "Live"
}

enum Timezone: String, Decodable {
    case utc = "utc"
}
// MARK: - Type Race
enum TypeEnum: String, Decodable {
    case sprint = "Sprint"
    case the1StPractice = "1st Practice"
    case the2NdPractice = "2nd Practice"
    case the3RDPractice = "3rd Practice"
    case the1StQualifying = "1st Qualifying"
    case the1StSprintShootout = "1st Sprint Shootout"
    case the2NdQualifying = "2nd Qualifying"
    case the2NdSprintShootout = "2nd Sprint Shootout"
    case the3RDQualifying = "3rd Qualifying"
    case the3RDSprintShootout = "3rd Sprint Shootout"
    case race = "Race"

}
// MARK: - Enum of image country
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

// MARK: - Tuple of Colors Team

let teamColor: [(name: String, color: UIColor)] = [
    ("Red Bull Racing", .systemBlue),
    ("Scuderia Ferrari", .systemRed),
    ("McLaren Racing", .orange),
    ("Mercedes-AMG Petronas", .black),
    ("Aston Martin F1 Team", .green),
    ("Visa Cash App RB Formula One Team", .purple),
    ("Haas F1 Team", .gray),
    ("Williams F1 Team", .magenta),
    ("Stake F1 Team Kick Sauber", .systemIndigo),
    ("Alpine F1 Team", .cyan)
]
// MARK: - Headers para cada seccion
enum Section: Int, CaseIterable {
    case header
    case schedule
    case about
    case fastestLap
    
    var title: String {
        switch self {
        case .header: return ""
        case .schedule: return "Schedule"
        case .about: return "About"
        case .fastestLap: return "Fastest Lap"
        }
    }
}

