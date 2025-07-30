//
//  ColorScheme.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import SwiftUI

struct AppColors {
    // Primary purple colors from Clarice design
    static let primaryPurple = Color(red: 0.4, green: 0.2, blue: 0.6) // Dark purple
    static let secondaryPurple = Color(red: 0.6, green: 0.4, blue: 0.8) // Medium purple
    static let lightPurple = Color(red: 0.8, green: 0.7, blue: 0.9) // Light purple
    
    // Background colors
    static let backgroundPrimary = Color.white
    static let backgroundSecondary = Color(red: 0.98, green: 0.97, blue: 1.0) // Very light purple tint
    
    // Accent colors from the design
    static let accentOrange = Color(red: 1.0, green: 0.6, blue: 0.2) // Orange accent
    static let accentGreen = Color(red: 0.2, green: 0.8, blue: 0.4) // Green accent
    static let accentPurple = Color(red: 0.5, green: 0.3, blue: 0.7) // Purple accent
    
    // Status colors
    static let statusPending = accentOrange
    static let statusCompleted = accentGreen
    static let statusOverdue = Color(red: 0.9, green: 0.3, blue: 0.3) // Red for overdue
    
    // Text colors
    static let textPrimary = Color.black
    static let textSecondary = Color(red: 0.4, green: 0.4, blue: 0.4)
    static let textOnPurple = Color.white
    
    // Card and border colors
    static let cardBackground = Color.white
    static let cardBorder = Color(red: 0.9, green: 0.9, blue: 0.95)
    static let cardShadow = Color.black.opacity(0.05)
}

extension Color {
    static let appPrimary = AppColors.primaryPurple
    static let appSecondary = AppColors.secondaryPurple
    static let appBackground = AppColors.backgroundPrimary
    static let appBackgroundSecondary = AppColors.backgroundSecondary
    static let appAccent = AppColors.accentOrange
} 