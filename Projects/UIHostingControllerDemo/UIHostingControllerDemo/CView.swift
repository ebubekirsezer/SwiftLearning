//
//  CView.swift
//  UIHostingControllerDemo
//
//  Created by Ebubekir Sezer on 19.09.2021.
//

import SwiftUI

struct CView: View {
    var body: some View {
        Text("Custom View in VC")
            .padding()
            .foregroundColor(.blue)
            .frame(width: 200, height: 150, alignment: .center)
            .background(Color.yellow)
    }
}

struct CView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
    }
}
