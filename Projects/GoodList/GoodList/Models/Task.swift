//
//  Task.swift
//  GoodList
//
//  Created by Ebubekir Sezer on 19.08.2021.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
