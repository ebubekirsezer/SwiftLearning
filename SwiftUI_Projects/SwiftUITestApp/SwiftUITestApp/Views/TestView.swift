//
//  TestView.swift
//  SwiftUITestApp
//
//  Created by Ebubekir Sezer on 27.01.2021.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ScrollView {
            VStack{
                Image("icybay")
                Text("Hello Protel")
                    .foregroundColor(.white)
                    .font(.title2)

            }            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
