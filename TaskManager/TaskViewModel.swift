//
//  TaskViewModel.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import Foundation
import SwiftUI
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let taskManager: TaskManager
    private var cancellables = Set<AnyCancellable>()
    
    init(taskManager: TaskManager = TaskManager()) {
        self.taskManager = taskManager
        setupBindings()
        loadTasks()
    }
    
    // MARK: - Computed Properties
    
        var currentTasks: [TaskItem] {
        return tasks.filter { !$0.isCompleted && !$0.isOverdue }
    }

    var completedTasks: [TaskItem] {
        return tasks.filter { $0.isCompleted }
    }

    var unfinishedTasks: [TaskItem] {
        return tasks.filter { !$0.isCompleted && $0.isOverdue }
    }
    
    var totalTaskCount: Int {
        return tasks.count
    }
    
    var completedTaskCount: Int {
        return completedTasks.count
    }
    
    var overdueTaskCount: Int {
        return unfinishedTasks.count
    }
    
    // MARK: - Task Operations
    
        func addTask(_ task: TaskItem) {
        isLoading = true
        taskManager.addTask(task)
        loadTasks()
    }

    func updateTask(_ task: TaskItem) {
        isLoading = true
        taskManager.updateTask(task)
        loadTasks()
    }

    func deleteTask(_ task: TaskItem) {
        isLoading = true
        taskManager.deleteTask(task)
        loadTasks()
    }

    func toggleTaskCompletion(_ task: TaskItem) {
        isLoading = true
        taskManager.toggleTaskCompletion(task)
        loadTasks()
    }
    
    func addSampleData() {
        isLoading = true
        taskManager.addSampleData()
        loadTasks()
    }
    
    func clearAllData() {
        isLoading = true
        taskManager.clearAllData()
        loadTasks()
    }
    
    // MARK: - Private Methods
    
    private func setupBindings() {
        // Observe task manager changes
        taskManager.tasksPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] tasks in
                self?.tasks = tasks
                self?.isLoading = false
                self?.errorMessage = nil
            }
            .store(in: &cancellables)
    }
    
    private func loadTasks() {
        // Tasks are automatically loaded through the binding
        // This method can be used for additional loading logic if needed
    }
    
    // MARK: - Task Validation
    
    func validateTask(title: String, description: String, deadline: Date) -> TaskValidationResult {
        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return .failure("Task title cannot be empty")
        }
        
        if deadline < Date() {
            return .failure("Deadline cannot be in the past")
        }
        
        return .success
    }
    
    // MARK: - Task Filtering
    
        func filterTasks(by status: TaskStatus) -> [TaskItem] {
        switch status {
        case .current:
            return currentTasks
        case .completed:
            return completedTasks
        case .overdue:
            return unfinishedTasks
        }
    }

    func searchTasks(query: String) -> [TaskItem] {
        guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return tasks
        }

        return tasks.filter { task in
            task.title.localizedCaseInsensitiveContains(query) ||
            task.description.localizedCaseInsensitiveContains(query)
        }
    }
}

// MARK: - Supporting Types

enum TaskStatus {
    case current
    case completed
    case overdue
}

enum TaskValidationResult {
    case success
    case failure(String)
} 