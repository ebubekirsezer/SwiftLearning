//
//  SwiftUITestAppApp.swift
//  SwiftUITestApp
//
//  Created by Ebubekir Sezer on 26.01.2021.
//

import SwiftUI

@main
struct SwiftUITestAppApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
