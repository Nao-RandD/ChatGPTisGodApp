//
//  Coloer+Extension.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/12.
//

import SwiftUI

extension Color {
    static var accentColor: (ColorScheme) -> Color = { colorScheme in
        if colorScheme == .dark {
            return .white
        } else {
            return Color("accent-color")
        }
    }
    static let backgroundColor: (ColorScheme) -> Color = { colorScheme in
        if colorScheme == .dark {
            return .black
        } else {
            return secondaryColor
        }
    }
    static let primaryColor = Color("primary-color")
    static let secondaryColor = Color("secondary-color")
    static let thirdColor = Color("third-color")
}
