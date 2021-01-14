//
//  AppWebService.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import Foundation

struct AppWebService {
        
    func getTopApps(appType: String, itemCount: Int, completion: @escaping(Result<AppFeed, MusicError>) -> Void) {
        guard let BASE_URL = URL(string: "https://rss.itunes.apple.com/api/v1/tr/ios-apps/\(appType)/all/\(itemCount)/explicit.json") else { fatalError() }
        let dataTask = URLSession.shared.dataTask(with: BASE_URL) { (data, response, error) in
            
            DispatchQueue.main.async {
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let appResponse = try decoder.decode(AppResponse.self, from: jsonData)
                    completion(.success(appResponse.feed))
                } catch {
                    completion(.failure(.fecthingError))
                }
            }
        }
        
        dataTask.resume()
    }
}
