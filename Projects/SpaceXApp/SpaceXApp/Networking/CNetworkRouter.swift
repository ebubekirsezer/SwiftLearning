//
//  CNetworkRouter.swift
//  SpaceXApp
//
//  Created by Ebubekir Sezer on 2.04.2021.
//

import Foundation
import Alamofire

public enum CNetworkRouter: URLRequestConvertible {

    case rockets
    case rocket(rocketID: String)
    
    public var method: HTTPMethod {
        switch self {
        case .rockets, .rocket:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .rockets:
            return "/rockets"
        case .rocket(let id):
            return "/rockets/\(id)"
        }
    }
    
    public var parameters: Parameters? {
        switch self {
        case .rockets, .rocket:
            return nil
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HttpHeaderField.contentType.rawValue)
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: AFError.ParameterEncodingFailureReason.jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

public enum CNetworkError: Error {
    case parseError
    case badUrlError
    case badRequestError
}
