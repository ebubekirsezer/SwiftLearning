//
//  CenterModifier.swift
//  Africa
//
//  Created by Ebubekir Sezer on 15.08.2021.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
