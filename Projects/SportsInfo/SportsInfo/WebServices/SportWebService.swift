//
//  SportWebService.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import Foundation

struct SportWebService {
    
    func getAllSportsBy(query: String, completion: @escaping(Result<[Sport], SportError>) -> Void){
        guard let url = URL(string: Constants.BASE_URL + query) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let sportRespone = try decoder.decode(SportResponse.self, from: jsonData)
                    completion(.success(sportRespone.sports))
                } catch {
                    completion(.failure(.fetchingError))
                }
                
            }
        }
        dataTask.resume()
    }
    
    func getEventsOnTurkey(query: String, completion: @escaping(Result<MatchEvent, SportError>) ->  Void){
        guard let url = URL(string: Constants.BASE_URL + query) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let matchEvents = try decoder.decode(MatchEvent.self, from: jsonData)
                    completion(.success(matchEvents))
                } catch {
                    completion(.failure(.fetchingError))
                }
            }
        }
        dataTask.resume()
    }
}
