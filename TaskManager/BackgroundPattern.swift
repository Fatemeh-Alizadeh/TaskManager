//
//  BackgroundPattern.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import SwiftUI

struct BackgroundPattern: View {
    var body: some View {
        ZStack {
            // Base background
            AppColors.backgroundSecondary
            
            // Geometric shapes inspired by Clarice design
            GeometryReader { geometry in
                ZStack {
                    // Plus signs
                    ForEach(0..<8, id: \.self) { index in
                        PlusShape()
                            .fill(AppColors.lightPurple.opacity(0.3))
                            .frame(width: 40, height: 40)
                            .position(
                                x: CGFloat.random(in: 0...geometry.size.width),
                                y: CGFloat.random(in: 0...geometry.size.height)
                            )
                            .rotationEffect(.degrees(Double.random(in: 0...360)))
                    }
                    
                    // Small circles
                    ForEach(0..<12, id: \.self) { index in
                        Circle()
                            .fill(AppColors.lightPurple.opacity(0.2))
                            .frame(width: CGFloat.random(in: 8...20))
                            .position(
                                x: CGFloat.random(in: 0...geometry.size.width),
                                y: CGFloat.random(in: 0...geometry.size.height)
                            )
                    }
                }
            }
        }
    }
}

struct PlusShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let centerX = rect.midX
        let centerY = rect.midY
        let width = rect.width * 0.3
        let height = rect.height * 0.3
        
        // Vertical line
        path.move(to: CGPoint(x: centerX, y: centerY - height))
        path.addLine(to: CGPoint(x: centerX, y: centerY + height))
        
        // Horizontal line
        path.move(to: CGPoint(x: centerX - width, y: centerY))
        path.addLine(to: CGPoint(x: centerX + width, y: centerY))
        
        return path
    }
}

#Preview {
    BackgroundPattern()
} 