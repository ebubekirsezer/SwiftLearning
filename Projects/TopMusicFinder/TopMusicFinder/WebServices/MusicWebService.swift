//
//  MusicWebService.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import Foundation

struct MusicWebService {
    let BASE_URL: URL
        
    init(countryCode: String, itemCount: Int) {
        let baseString = "https://rss.itunes.apple.com/api/v1/\(countryCode)/apple-music/top-songs/all/\(itemCount)/explicit.json"
        guard let BASE_URL = URL(string: baseString) else { fatalError() }
        self.BASE_URL = BASE_URL
    }
    
    
    func fetchTopMusics(completion: @escaping(Result<MusicFeed, MusicError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: BASE_URL) { data, response, error in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
                        
            do {
                let decoder = JSONDecoder()
                let musicResponse = try decoder.decode(MusicResponse.self, from: jsonData)
                let musicFeed = musicResponse.feed
                completion(.success(musicFeed))
            } catch {
                completion(.failure(.fecthingError))
            }
        }
        
        dataTask.resume()
    }
    
}
