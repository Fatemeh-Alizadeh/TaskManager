//
//  TaskListView.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskViewModel: TaskViewModel
    let tasks: [TaskItem]
    let title: String
    let emptyMessage: String
    let emptyIcon: String
    let allowCompletion: Bool
    
    @State private var showingAddTask = false
    @State private var editingTask: TaskItem?
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background pattern inspired by Clarice design
                BackgroundPattern()
                    .ignoresSafeArea()
                
                if taskViewModel.isLoading {
                    LoadingView("Loading tasks...")
                } else if tasks.isEmpty {
                    // Empty state
                    VStack(spacing: 20) {
                        Image(systemName: emptyIcon)
                            .font(.system(size: 60))
                            .foregroundColor(AppColors.textSecondary)
                        
                        Text(emptyMessage)
                            .font(.title2)
                            .foregroundColor(AppColors.textSecondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                } else {
                    // Task list
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(tasks) { task in
                                TaskRowView(
                                    task: task,
                                    onToggle: {
                                        if allowCompletion {
                                            taskViewModel.toggleTaskCompletion(task)
                                        }
                                    },
                                    onEdit: {
                                        editingTask = task
                                    },
                                    allowCompletion: allowCompletion
                                )
                                .padding(.horizontal, 16)

                            }
                        }
                        .padding(.vertical, 16)
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showingSettings = true }) {
                        Image(systemName: "gearshape")
                            .font(.title2)
                            .foregroundColor(AppColors.primaryPurple)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddTask = true }) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(AppColors.primaryPurple)
                    }
                }
            }
            .sheet(isPresented: $showingAddTask) {
                AddEditTaskView(taskViewModel: taskViewModel, editingTask: TaskItem(title: "", description: "", deadline: Date().addingTimeInterval(3600)))
            }
            .sheet(item: $editingTask) { task in
                AddEditTaskView(taskViewModel: taskViewModel, editingTask: task)
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView(taskViewModel: taskViewModel)
            }
        }
    }
} 
