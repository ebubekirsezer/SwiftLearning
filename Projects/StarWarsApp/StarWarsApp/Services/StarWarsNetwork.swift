//
//  StarWarsNetwork.swift
//  StarWarsApp
//
//  Created by Ebubekir Sezer on 6.04.2021.
//

import Foundation
import Alamofire

class StarWarsNetwork {
    public static let shared = StarWarsNetwork()
    
    func request(path: String, completion: @escaping (Result<Characters, StarWarsError>) -> Void) {
        do {
            AF.request(Constants.baseUrl)
                .validate()
                .responseJSON{ (response) in
                    switch response.result {
                    case .success(let data):
                        do {
                            if let resultValue = data as? [String:Any] {
                                let jsonData = try JSONSerialization.data(withJSONObject: resultValue, options: .prettyPrinted)
                                let jsonResults = try JSONDecoder().decode(Characters.self, from: jsonData)
                                completion(.success(jsonResults))
                            }
                        } catch {
                            completion(.failure(.badJediRequest))
                        }
                    case .failure( _):
                        completion(.failure(.darthVaderNotFound))
                    }
                }
        } catch {
            print("Hata")
        }
        
    }
}
