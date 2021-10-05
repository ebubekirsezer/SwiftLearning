//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Ebubekir Sezer on 16.08.2021.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
