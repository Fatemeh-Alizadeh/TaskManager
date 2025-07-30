//
//  NavigationBarModifier.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(AppColors.backgroundPrimary)
                appearance.titleTextAttributes = [.foregroundColor: UIColor(AppColors.textPrimary)]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(AppColors.textPrimary)]
                
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
                UINavigationBar.appearance().tintColor = UIColor(AppColors.primaryPurple)
            }
    }
}

extension View {
    func purpleNavigationBar() -> some View {
        self.modifier(NavigationBarModifier())
    }
} 