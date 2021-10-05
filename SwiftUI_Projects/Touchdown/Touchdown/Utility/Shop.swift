//
//  Shop.swift
//  Touchdown
//
//  Created by Ebubekir Sezer on 16.08.2021.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProducts: Bool = false
    @Published var selectedProduct: Product?
}
