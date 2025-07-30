//
//  TaskManager.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    @Published private(set) var tasks: [TaskItem] = []
    
    init() {
        loadTasks()
    }
    
    // MARK: - Task Operations
    
    func addTask(_ task: TaskItem) {
        tasks.append(task)
        saveTasks()
    }
    
    func updateTask(_ task: TaskItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
            saveTasks()
        }
    }
    
    func deleteTask(_ task: TaskItem) {
        tasks.removeAll { $0.id == task.id }
        saveTasks()
    }
    
    func toggleTaskCompletion(_ task: TaskItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    // MARK: - Task Filtering
    
    var currentTasks: [TaskItem] {
        return tasks.filter { !$0.isCompleted && !$0.isOverdue }
    }
    
    var completedTasks: [TaskItem] {
        return tasks.filter { $0.isCompleted }
    }
    
    var unfinishedTasks: [TaskItem] {
        return tasks.filter { !$0.isCompleted && $0.isOverdue }
    }
    
    // MARK: - Published Properties for Combine
    
    var tasksPublisher: Published<[TaskItem]>.Publisher {
        return $tasks
    }
    
    // MARK: - Internal Access Methods
    
    func clearAllTasks() {
        tasks.removeAll()
        saveTasks()
    }
    
    func getTasks() -> [TaskItem] {
        return tasks
    }
    
    // MARK: - Persistence
    
    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }
    
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: "tasks"),
           let decoded = try? JSONDecoder().decode([TaskItem].self, from: data) {
            tasks = decoded
        }
    }
} 