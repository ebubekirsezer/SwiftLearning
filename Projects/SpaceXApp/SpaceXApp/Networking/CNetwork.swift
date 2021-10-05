//
//  CNetwork.swift
//  SpaceXApp
//
//  Created by Ebubekir Sezer on 2.04.2021.
//

import Foundation
import Alamofire

public final class CNetwork {
    public static let shared = CNetwork()
    
    public func execute<M: Codable>(requestRoute: CNetworkRouter,
                                    responseModel: M.Type,
                                    isLoaderActive: Bool = true,
                                    completion: @escaping (Swift.Result<M, CNetworkError>) -> Void) {
        
        if isLoaderActive {
            print("loading")
        }
        
        do {
            let urlRequest = try requestRoute.asURLRequest()
            AF.request(urlRequest).validate().responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        if let resultValue = value as? [String: Any] {
                            let jsonData = try JSONSerialization.data(withJSONObject: resultValue, options: .prettyPrinted)
                            let jsonResults = try JSONDecoder().decode(responseModel, from: jsonData)
                            completion(.success(jsonResults))
                        }
                    } catch {
                        print("HATA")
                        completion(.failure(.parseError))
                    }
                case .failure(let error):
                    print("HATA")
                    completion(.failure(.badRequestError))
                }
            }
        } catch {
            print("HATA")
            completion(.failure(.badUrlError))
        }
    }
}
