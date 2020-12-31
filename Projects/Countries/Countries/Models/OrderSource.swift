//
//  OrderSource.swift
//  Countries
//
//  Created by Ebubekir Sezer on 31.12.2020.
//

import Foundation

class OrderSource {
    static let orderLists: [Order] = [
        Order(orderType: "A-Z", isSelected: false),
        Order(orderType: "Z-A", isSelected: false),
        Order(orderType: "Fiyat Artan", isSelected: false),
        Order(orderType: "Fiyat Azalan", isSelected: false),
        Order(orderType: "En Çok Satanlar", isSelected: false),
    ]
}
