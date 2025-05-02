//
//  UIConstants.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import SwiftUI

struct UIConstants {
    
    // MARK: Top Bar
    var topBarHeight: CGFloat { 44.0 }
    var trailingIconPadding: CGFloat { 10 }
    
    // MARK: Search Bar
    var searchBarPadding: CGFloat { 8.0 }
    
    // MARK: List Tile Custom
    var horizontalSpacingTen: CGFloat { 10.0 }
    var internalPadding: CGFloat { 5.0 }
    var externalRadius: CGFloat { 12.0 }
    var imageSize: CGFloat { 115.0 }
    var imageCornerRadius: CGFloat { 8.0 }
    var starSize: CGFloat { 10.0 }
    var spacingTwo: CGFloat { 5.0 }
}

// MARK: - Assets
extension Color {
    static let meliGreen = Color(red: 0.0, green: 0.62, blue: 0.45)
    static let meliYellow = Color(red: 1, green: 0.84, blue: 0)
    static let meliBlue = Color(red: 0, green: 0.44, blue: 0.80)
}
