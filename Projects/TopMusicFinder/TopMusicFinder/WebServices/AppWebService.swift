//
//  AppWebService.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import Foundation

struct AppWebService {
    
//    func getTopBy(mediaType: String, feedType: String, itemCount: Int, completion: @escaping()){
//
//    }
        
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
    
    func getTopBooks(bookType: String, itemCount: Int, completion: @escaping(Result<BookFeed, MusicError>) -> Void){
        guard let BASE_URL = URL(string: "https://rss.itunes.apple.com/api/v1/us/books/\(bookType)/all/\(itemCount)/explicit.json") else { fatalError() }
        
        let dataTask = URLSession.shared.dataTask(with: BASE_URL) { (data, response, error) in
            DispatchQueue.main.async {
                
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let bookResponse = try decoder.decode(BookResponse.self, from: jsonData)
                    completion(.success(bookResponse.feed))
                } catch{
                    completion(.failure(.fecthingError))
                }
            }
        }
        dataTask.resume()
    }
}
