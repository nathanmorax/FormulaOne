// MARK: - Welcome
/*struct WelcomeR: Decodable {
    let welcomeGet: String?
    let parameters: Parameterss?
    //let errors: [JSONAny]
    let results: Int?
    let response: [Drivers]?

    enum CodingKeys: String, CodingKey {
        case welcomeGet = "get"
        case parameters, results, response
    }
}

// MARK: - Parameters
struct Parameterss: Decodable {
    let id: String?
}

// MARK: - Response
struct Drivers: Decodable {
   let id: String?
   let name: String?
   let abbr: String?
   let image: String?
   let nationality: String?
   let country: Country?
   let birthdate, birthplace: String?
   let number, grandsPrixEntered, worldChampionships, podiums: Int?
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
}*/
