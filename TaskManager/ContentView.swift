//
//  ContentView.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var taskViewModel = TaskViewModel()
    
    var body: some View {
        TabView {
            // Current Tasks Tab
            TaskListView(
                taskViewModel: taskViewModel,
                tasks: taskViewModel.currentTasks,
                title: "Current Tasks",
                emptyMessage: "No current tasks\nTap the + button to add a new task",
                emptyIcon: "checklist",
                allowCompletion: true
            )
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Current")
            }
            
            // Completed Tasks Tab
            TaskListView(
                taskViewModel: taskViewModel,
                tasks: taskViewModel.completedTasks,
                title: "Completed Tasks",
                emptyMessage: "No completed tasks yet\nComplete some tasks to see them here",
                emptyIcon: "checkmark.circle",
                allowCompletion: true
            )
            .tabItem {
                Image(systemName: "checkmark.circle.fill")
                Text("Completed")
            }
            
            // Unfinished Tasks Tab
            TaskListView(
                taskViewModel: taskViewModel,
                tasks: taskViewModel.unfinishedTasks,
                title: "Unfinished Tasks",
                emptyMessage: "No overdue tasks\nGreat job staying on schedule!",
                emptyIcon: "exclamationmark.triangle",
                allowCompletion: false
            )
            .tabItem {
                Image(systemName: "exclamationmark.triangle.fill")
                Text("Unfinished")
            }
        }
        .accentColor(AppColors.primaryPurple)
        .onAppear {
            // Set up tab bar appearance with purple theme
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(AppColors.backgroundPrimary)
            
            // Customize tab bar colors
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(AppColors.primaryPurple)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(AppColors.primaryPurple)]
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(AppColors.textSecondary)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(AppColors.textSecondary)]
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            
            // Add sample data for first launch
            taskViewModel.addSampleData()
        }
        .purpleNavigationBar()
    }
}

#Preview {
    ContentView()
}
