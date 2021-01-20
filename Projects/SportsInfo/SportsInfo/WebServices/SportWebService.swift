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
    
    func getLeaguesBySportName(query: String, completion: @escaping(Result<Countries, SportError>) -> Void){
        guard let url = URL(string: Constants.BASE_URL + query) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let countries = try decoder.decode(Countries.self, from: jsonData)
                    completion(.success(countries))
                } catch {
                    completion(.failure(.fetchingError))
                }
            }
        }
        dataTask.resume()
    }
    
    func getTeamsInLeague(query: String, completion: @escaping(Result<Team, SportError>) -> Void){
        guard let url = URL(string: Constants.BASE_URL + query) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let teams = try decoder.decode(Team.self, from: jsonData)
                    completion(.success(teams))
                } catch {
                    completion(.failure(.fetchingError))
                }
            }
        }
        dataTask.resume()
    }
    
    func searchTeamBy(query: String, completion: @escaping(Result<Team, SportError>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + query) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let teams = try decoder.decode(Team.self, from: jsonData)
                    completion(.success(teams))
                } catch {
                    completion(.failure(.fetchingError))
                }
            }
        }
        dataTask.resume()
    }
    
    func searchPlayerBy(query: String, completion: @escaping(Result<Player, SportError>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + query) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let players = try decoder.decode(Player.self, from: jsonData)
                    completion(.success(players))
                } catch {
                    completion(.failure(.fetchingError))
                }
            }
        }
        dataTask.resume()
    }
}
