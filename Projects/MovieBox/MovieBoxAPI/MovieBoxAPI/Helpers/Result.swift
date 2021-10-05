//
//  Result.swift
//  MovieBoxAPI
//
//  Created by Ebubekir Sezer on 17.04.2021.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
