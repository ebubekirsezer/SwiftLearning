//
//  AppWebService.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import Foundation

struct AppWebService {
    
    func getTopBy(mediaType: String, feedType: String, itemCount: Int, completion: @escaping(Result<MediaFeed, MediaError>) -> Void){
        guard let BASE_URL = URL(string: "https://rss.itunes.apple.com/api/v1/tr/\(mediaType)/\(feedType)/all/\(itemCount)/explicit.json") else { fatalError() }
        
        let dataTask = URLSession.shared.dataTask(with: BASE_URL) { (data, response, error) in
            DispatchQueue.main.async {
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do{
                    let decoder = JSONDecoder()
                    let mediaResponse = try decoder.decode(MediaResponse.self, from: jsonData)
                    completion(.success(mediaResponse.feed))
                } catch{
                    completion(.failure(.fecthingError))
                }
            }
        }
        dataTask.resume()
    }
}
