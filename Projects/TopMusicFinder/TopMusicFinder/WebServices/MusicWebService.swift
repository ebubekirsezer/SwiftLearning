//
//  MusicWebService.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import Foundation

struct MusicWebService {
    
    
    func fetchTopMusics(completion: @escaping(Result<[Music], MusicError>) -> Void) {
        guard let resourceURL = Constants.BASE_URL else { fatalError() }
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
                        
            do {
                let decoder = JSONDecoder()
                let musicResponse = try decoder.decode(MusicResponse.self, from: jsonData)
                let musics = musicResponse.feed.results
                completion(.success(musics))
            } catch {
                completion(.failure(.fecthingError))
            }
        }
        
        dataTask.resume()
    }
    
}
