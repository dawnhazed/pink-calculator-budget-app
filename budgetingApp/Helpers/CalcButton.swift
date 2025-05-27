//
//  CalcButton.swift
//  budgetingApp
//
//  Created by Nadaa Shafa Nadhifa on 24/05/25.
//

import SwiftUI

enum CalcButton: String {
    case one    = "1"
    case two    = "2"
    case three  = "3"
    case four   = "4"
    case five   = "5"
    case six    = "6"
    case seven  = "7"
    case eight  = "8"
    case nine   = "9"
    case zero   = "0"
    case triple = "000"
    case clear  = "AC"
    case delete = "DEL"
    case enter  = "Enter"
    case decimal  = "."
    case settings = "Settings"
    
    var buttonColor: Color {
        switch self {
        case .enter:
            return .coralPink
        case .triple:
            return .lightCoral
        case .delete, .clear:
            return .lightCoral
        case .settings:
            return .paleOrange
        default:
            return .white
        }
    }
}
