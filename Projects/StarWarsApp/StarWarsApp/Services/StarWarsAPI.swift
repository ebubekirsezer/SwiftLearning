//
//  StarWarsAPI.swift
//  StarWarsApp
//
//  Created by Ebubekir Sezer on 6.04.2021.
//

import Foundation

protocol StarWarsStoreProtocol {
    func getCharacters(completion: @escaping ((_ response: Characters, _ error: StarWarsError?) -> Void))
}

class StarWarsAPI: StarWarsStoreProtocol {
    func getCharacters(completion: @escaping ((Characters, StarWarsError?) -> Void)) {
        
        StarWarsNetwork.shared.request(path: "people") { (response) in
            switch response {
            case .success(let characters):
                completion(characters, nil)
            case .failure(let error):
                completion(Characters(count: 0, results: []), error)
            }
        }
    }
}
