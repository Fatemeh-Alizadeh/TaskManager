//
//  AddEditTaskView.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import SwiftUI

struct AddEditTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var taskViewModel: TaskViewModel
    
    @State private var title = ""
    @State private var description = ""
    @State private var deadline = Date()
    @State private var showingValidationError = false
    @State private var validationErrorMessage = ""
    
    let editingTask: TaskItem?
    
    init(taskViewModel: TaskViewModel, editingTask: TaskItem) {
        self.taskViewModel = taskViewModel
        self.editingTask = editingTask
        
        _title = State(initialValue: editingTask.title)
        _description = State(initialValue: editingTask.description)
        _deadline = State(initialValue: editingTask.deadline)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Task Title", text: $title)
                        .font(.headline)
                    
                    TextField("Description (Optional)", text: $description, axis: .vertical)
                        .lineLimit(3...6)
                }
                
                Section(header: Text("Deadline")) {
                    DatePicker("Due Date & Time", selection: $deadline, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.compact)
                }
                
                if let task = editingTask {
                    Section(header: Text("Task Status")) {
                        HStack {
                            Text("Status")
                            Spacer()
                            Text(task.statusText)
                                .foregroundColor(task.statusColor)
                                .font(.subheadline)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(task.statusColor.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .navigationTitle(editingTask != nil ? "Edit Task" : "New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(AppColors.primaryPurple)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(editingTask != nil ? "Save" : "Add") {
                        saveTask()
                    }
                    .foregroundColor(AppColors.primaryPurple)
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
        .alert("Validation Error", isPresented: $showingValidationError) {
            Button("OK") { }
        } message: {
            Text(validationErrorMessage)
        }
    }
    
    private func saveTask() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedDescription = description.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Validate task using ViewModel
        let validationResult = taskViewModel.validateTask(
            title: trimmedTitle,
            description: trimmedDescription,
            deadline: deadline
        )
        
        switch validationResult {
        case .success:
            if let existingTask = editingTask {
                // Update existing task
                var updatedTask = existingTask
                updatedTask.title = trimmedTitle
                updatedTask.description = trimmedDescription
                updatedTask.deadline = deadline
                taskViewModel.updateTask(updatedTask)
            } else {
                // Create new task
                let newTask = TaskItem(
                    title: trimmedTitle,
                    description: trimmedDescription,
                    deadline: deadline
                )
                taskViewModel.addTask(newTask)
            }
            dismiss()
            
        case .failure(let error):
            validationErrorMessage = error
            showingValidationError = true
        }
    }
} 
