//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Ebubekir Sezer on 15.08.2021.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
