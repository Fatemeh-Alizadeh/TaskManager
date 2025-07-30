//
//  SettingsView.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var taskViewModel: TaskViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var showingClearConfirmation = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Data Management")) {
                    Button(action: {
                        taskViewModel.addSampleData()
                    }) {
                        HStack {
                            Image(systemName: "plus.circle")
                                .foregroundColor(AppColors.primaryPurple)
                            Text("Add Sample Data")
                                .foregroundColor(AppColors.primaryPurple)
                            Spacer()
                        }
                    }
                    
                    Button(action: {
                        showingClearConfirmation = true
                    }) {
                        HStack {
                            Image(systemName: "trash")
                                .foregroundColor(AppColors.statusOverdue)
                            Text("Clear All Data")
                                .foregroundColor(AppColors.statusOverdue)
                            Spacer()
                        }
                    }
                }
                
                Section(header: Text("App Information")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(AppColors.textSecondary)
                    }
                    
                    HStack {
                        Text("Total Tasks")
                        Spacer()
                        Text("\(taskViewModel.totalTaskCount)")
                            .foregroundColor(AppColors.textSecondary)
                    }
                    
                    HStack {
                        Text("Completed Tasks")
                        Spacer()
                        Text("\(taskViewModel.completedTaskCount)")
                            .foregroundColor(AppColors.textSecondary)
                    }
                    
                    HStack {
                        Text("Overdue Tasks")
                        Spacer()
                        Text("\(taskViewModel.overdueTaskCount)")
                            .foregroundColor(AppColors.textSecondary)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(AppColors.primaryPurple)
                }
            }
            .alert("Clear All Data", isPresented: $showingClearConfirmation) {
                Button("Cancel", role: .cancel) { }
                Button("Clear", role: .destructive) {
                    taskViewModel.clearAllData()
                }
            } message: {
                Text("This will permanently delete all your tasks. This action cannot be undone.")
            }
        }
    }
} 