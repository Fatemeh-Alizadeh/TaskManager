//
//  Task.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import Foundation
import SwiftUI

struct TaskItem: Identifiable, Codable {
    let id = UUID()
    var title: String
    var description: String
    var deadline: Date
    var isCompleted: Bool
    var createdAt: Date
    
    init(title: String, description: String, deadline: Date, isCompleted: Bool = false) {
        self.title = title
        self.description = description
        self.deadline = deadline
        self.isCompleted = isCompleted
        self.createdAt = Date()
    }
    
    // MARK: - Computed Properties
    
    var isOverdue: Bool {
        return !isCompleted && deadline < Date()
    }
    
    var statusColor: Color {
        if isCompleted {
            return AppColors.statusCompleted
        } else if isOverdue {
            return AppColors.statusOverdue
        } else {
            return AppColors.statusPending
        }
    }
    
    var statusText: String {
        if isCompleted {
            return "Completed"
        } else if isOverdue {
            return "Overdue"
        } else {
            return "Pending"
        }
    }
} 