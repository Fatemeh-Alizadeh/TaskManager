//
//  TaskRowView.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import SwiftUI

struct TaskRowView: View {
    let task: TaskItem
    let onToggle: () -> Void
    let onEdit: () -> Void
    let onDelete: () -> Void
    let allowCompletion: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            // Completion checkbox - only show if completion is allowed
            if allowCompletion {
                Button(action: onToggle) {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? AppColors.statusCompleted : AppColors.textSecondary)
                        .font(.title2)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            // Task content
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(task.title)
                        .font(.headline)
                        .foregroundColor(task.isCompleted ? AppColors.textSecondary : AppColors.textPrimary)
                        .strikethrough(task.isCompleted)
                    
                    Spacer()
                    
                    // Status indicator
                    Text(task.statusText)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(task.statusColor.opacity(0.2))
                        .foregroundColor(task.statusColor)
                        .cornerRadius(8)
                }
                
                if !task.description.isEmpty {
                    Text(task.description)
                        .font(.subheadline)
                        .foregroundColor(AppColors.textSecondary)
                        .lineLimit(2)
                }
                
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(AppColors.textSecondary)
                        .font(.caption)
                    
                    Text(task.deadline, style: .date)
                        .font(.caption)
                        .foregroundColor(AppColors.textSecondary)
                    
                    Text(task.deadline, style: .time)
                        .font(.caption)
                        .foregroundColor(AppColors.textSecondary)
                    
                    Spacer()
                }
            }
            
            // Action buttons
            HStack(spacing: 8) {
                // Edit button
                Button(action: onEdit) {
                    Image(systemName: "pencil")
                        .foregroundColor(AppColors.primaryPurple)
                        .font(.title3)
                }
                .buttonStyle(PlainButtonStyle())
                
                // Delete button
                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .foregroundColor(AppColors.statusOverdue)
                        .font(.title3)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(AppColors.cardBackground)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(AppColors.cardBorder, lineWidth: 1)
        )
        .shadow(color: AppColors.cardShadow, radius: 4, x: 0, y: 2)
    }
} 
