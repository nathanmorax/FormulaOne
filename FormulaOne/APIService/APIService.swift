//
//  APIService.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    func fetchRankingsTeams(completion: @escaping(ServiceRespons?, Error?) ->()) {
        let urlString = "https://v1.formula-1.api-sports.io/rankings/drivers?season=2023"
        fetchDataGeneric(urlString: urlString, completion: completion)
    }
    
    func fetchRankigsDrivers(completion: @escaping(ServiceRespons?, Error?) -> ()) {
        let urlString = "https://v1.formula-1.api-sports.io/rankings/drivers?season=2024"
        fetchDataGeneric(urlString: urlString, completion: completion)
    }
    func fetchScheduleCompetition(idCompetition: Int,completion: @escaping(ServiceRespons?, Error?) -> ()) {
        let urlString = "https://v1.formula-1.api-sports.io/races?season=2024&competition=\(idCompetition)"
        fetchDataGeneric(urlString: urlString, completion: completion)
    }
    func fetchScheduleRace(completion: @escaping(ServiceRespons?, Error?) -> ()) {
        let urlString = "https://v1.formula-1.api-sports.io/races?season=2024&type=race"
        fetchDataGeneric(urlString: urlString, completion: completion)
    }
    
    func fetchDataGeneric<T: Decodable>(urlString: String, completion: @escaping(T?, Error?) ->()) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        
        request.setValue("0b7e6ef1cb0f427b725840048b514534", forHTTPHeaderField: "x-rapidapi-key")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data, error == nil else {
                completion(nil, error)
                return
            }
            do {
                print("Data: ", String(decoding: data, as: UTF8.self))
                let objects = try JSONDecoder().decode(T.self, from: data)
                completion(objects, nil)
            } catch {
                print("decoding error:", error)
                completion(nil, error)
            }
            
        }.resume()
    }
}

