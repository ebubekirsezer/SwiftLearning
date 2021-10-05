//
//  HeadingView.swift
//  Africa
//
//  Created by Ebubekir Sezer on 14.08.2021.
//

import SwiftUI

struct HeadingView: View {
    
    //MARK: - PROPERTIES
    var headingImage: String
    var headingText: String
    
    
    //MARK: - BODY
    var body: some View {
        HStack(content: {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        })
    }
}


//MARK: - PREVIEW
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
