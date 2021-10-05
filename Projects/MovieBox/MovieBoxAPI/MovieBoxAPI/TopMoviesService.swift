//
//  TopMoviesService.swift
//  MovieBoxAPI
//
//  Created by Ebubekir Sezer on 17.04.2021.
//

import Foundation
import Alamofire

public protocol TopmoviesServiceProtocol {
    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void)
}

public class TopMoviesService: TopmoviesServiceProtocol {
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() {
        
    }
    
    public func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
        //https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/10/explicit.json
        let urlString = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/10/explicit.json"
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(TopMoviesResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
