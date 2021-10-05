//
//  SampleView.swift
//  SwiftUITestApp
//
//  Created by Ebubekir Sezer on 27.01.2021.
//

import SwiftUI

struct SampleView: View {
    
    @State private var name: String = " "
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.yellow)
                    Image("icybay")
                    Text("Hello SwiftUI")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                Text("Hello \(name)")
                    .frame(alignment: .leading)
                
                TextField("Enter your name: ", text: $name)
                    .border(Color.gray, width: 1)
                    .font(.title)
                    .cornerRadius(3)

                Button("Press") {
                    print("Button pressed")
                }
                .padding()
                .frame(width: 100, height: 40, alignment: .leading)
                .foregroundColor(.white)
                .background(Color.blue)
            }
                .padding()
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
