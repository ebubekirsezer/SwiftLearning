//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Ebubekir Sezer on 23.08.2021.
//

import SwiftUI

#if canImport(UIKit)

extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#endif
