//
//  OrderSource.swift
//  Countries
//
//  Created by Ebubekir Sezer on 31.12.2020.
//

import Foundation

class OrderSource {
    static let orderLists: [Order] = [
        Order(orderType: "A-Z", isSelected: false, orderKind: .AtoZ),
        Order(orderType: "Z-A", isSelected: false, orderKind: .ZtoA),
        Order(orderType: "Fiyat Artan", isSelected: false, orderKind: .Original),
        Order(orderType: "Fiyat Azalan", isSelected: false, orderKind: .Original),
        Order(orderType: "En Çok Satanlar", isSelected: false, orderKind: .Original),
    ]
}
