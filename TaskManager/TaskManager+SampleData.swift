//
//  TaskManager+SampleData.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import Foundation

extension TaskManager {
    func addSampleData() {
        // Only add sample data if no tasks exist
        guard tasks.isEmpty else { return }
        
        let sampleTasks = [
            TaskItem(
                title: "Complete Project Proposal",
                description: "Finish the quarterly project proposal for the marketing team",
                deadline: Date().addingTimeInterval(86400 * 2), // 2 days from now
                isCompleted: false
            ),
            TaskItem(
                title: "Review Code Changes",
                description: "Review pull requests for the mobile app update",
                deadline: Date().addingTimeInterval(3600 * 4), // 4 hours from now
                isCompleted: false
            ),
            TaskItem(
                title: "Team Meeting",
                description: "Weekly standup with the development team",
                deadline: Date().addingTimeInterval(-3600 * 2), // 2 hours ago (overdue)
                isCompleted: false
            ),
            TaskItem(
                title: "Update Documentation",
                description: "Update API documentation for the new features",
                deadline: Date().addingTimeInterval(-86400), // 1 day ago (overdue)
                isCompleted: false
            ),
            TaskItem(
                title: "Setup Development Environment",
                description: "Install and configure the new development tools",
                deadline: Date().addingTimeInterval(-86400 * 3), // 3 days ago
                isCompleted: true
            ),
            TaskItem(
                title: "Code Review",
                description: "Review the authentication module changes",
                deadline: Date().addingTimeInterval(-3600 * 6), // 6 hours ago
                isCompleted: true
            )
        ]
        
        for task in sampleTasks {
            addTask(task)
        }
    }
    
    func clearAllData() {
        clearAllTasks()
    }
} 