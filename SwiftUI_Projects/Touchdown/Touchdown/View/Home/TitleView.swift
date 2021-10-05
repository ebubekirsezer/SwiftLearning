//
//  TitleView.swift
//  Touchdown
//
//  Created by Ebubekir Sezer on 16.08.2021.
//

import SwiftUI

struct TitleView: View {
    
    //MARK: - PROPERTY
    
    var title: String
    
    //MARK: - BODY
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.heavy)
            Spacer()
        } //: HSTACK
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

//MARK: - PREVIEW

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Helmet")
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
