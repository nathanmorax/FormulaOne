//
//  Team.swift
//  FormulaOne
//
//  Created by Nathan Mora on 03/05/24.
//

import Foundation

struct ServiceTeamResponse: Decodable {
    let welcomeGet: String?
    let parameters: Parameter?
    //let errors: [JSONAny]
    let results: Int?
    let response: [TeamResponse]?

    enum CodingKeys: String, CodingKey {
        case welcomeGet = "get"
        case parameters, results, response
    }
}

// MARK: - Parameters
struct Parameter: Decodable {
    let season: String?
}

// MARK: - Response
struct TeamResponse: Decodable {
    let position: Int?
    let team: Teams?
    let points, season: Int?
}

// MARK: - Team
struct Teams: Decodable {
    let id: Int?
    let name: String?
    let logo: String?
}
