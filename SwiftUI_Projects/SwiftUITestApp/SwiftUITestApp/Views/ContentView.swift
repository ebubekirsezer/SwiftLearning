//
//  ContentView.swift
//  SwiftUITestApp
//
//  Created by Ebubekir Sezer on 26.01.2021.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        SampleView()
        //LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
