# TaskManager - iOS Task Management App

A modern, clean iOS task management application built with SwiftUI, inspired by the Clarice Care Circles design aesthetic. This app helps you organize and track your tasks with deadline management and status tracking.

## Features

### 🎯 Core Functionality
- **Create Tasks**: Add new tasks with title, description, and deadline
- **Edit Tasks**: Modify existing tasks at any time
- **Task Completion**: Mark tasks as completed with a simple tap (disabled for overdue tasks)
- **Deadline Tracking**: Automatic status updates based on deadlines
- **Persistent Storage**: Tasks are saved locally using UserDefaults

### 📱 Three-Tab Interface
1. **Current Tasks**: Active tasks that are not overdue
2. **Completed Tasks**: Successfully completed tasks
3. **Unfinished Tasks**: Tasks that have passed their deadline

### 🎨 Design Features
- **Purple Color Scheme**: Inspired by the Clarice Care Circles design with primary purple, white, and accent colors
- **Status Indicators**: Color-coded status badges (Orange for Pending, Green for Completed, Red for Overdue)
- **Modern Icons**: SF Symbols for consistent iOS design
- **Responsive Layout**: Optimized for all iPhone screen sizes
- **Smooth Animations**: Fluid transitions and interactions
- **Background Patterns**: Subtle geometric shapes and plus signs inspired by the Clarice design

### ⚙️ Additional Features
- **Settings Panel**: Access app statistics and data management
- **Sample Data**: Pre-loaded sample tasks for testing
- **Data Management**: Clear all data or add sample data
- **Empty States**: Helpful messages when no tasks exist

## Screenshots

The app features a clean, modern interface with:
- Tab bar navigation between Current, Completed, and Unfinished tasks
- Task cards with status indicators and deadline information
- Add/Edit task forms with date pickers
- Settings panel with app statistics

## Technical Details

### Architecture
- **SwiftUI**: Modern declarative UI framework
- **MVVM Pattern**: Model-View-ViewModel architecture for clean separation of concerns
- **ObservableObject**: Reactive data binding with @Published properties
- **UserDefaults**: Simple local data persistence
- **Combine**: Reactive programming for data flow

### MVVM Implementation
- **Model**: `Task.swift` - Data structure and business logic
- **View**: SwiftUI views (`ContentView`, `TaskListView`, `TaskRowView`, etc.) - UI presentation
- **ViewModel**: `TaskViewModel.swift` - Business logic, data operations, and state management
- **Data Layer**: `TaskManager.swift` - Data persistence and CRUD operations

### File Structure
```
TaskManager/
├── TaskManagerApp.swift          # App entry point
├── ContentView.swift             # Main tab view
├── Task.swift                    # Task data model (Model)
├── TaskViewModel.swift           # ViewModel for business logic and state management
├── TaskManager.swift             # Data layer for persistence and CRUD operations
├── TaskListView.swift            # List view for each tab (View)
├── TaskRowView.swift             # Individual task row component (View)
├── AddEditTaskView.swift         # Task creation/editing form (View)
├── SettingsView.swift            # Settings and data management (View)
├── TaskManager+SampleData.swift  # Sample data extension
├── LoadingView.swift             # Loading state components (View)
├── ColorScheme.swift             # Custom purple color palette
├── NavigationBarModifier.swift   # Custom navigation bar styling
└── BackgroundPattern.swift       # Decorative background elements
```

### Key Components

#### Task Model
- `id`: Unique identifier
- `title`: Task name
- `description`: Optional task details
- `deadline`: Due date and time
- `isCompleted`: Completion status
- `createdAt`: Creation timestamp
- Computed properties for status and colors

#### TaskViewModel Class
- Business logic and state management
- Task operations (add, update, delete, toggle completion)
- Data validation and filtering
- Loading state management
- Error handling
- Reactive data binding with Combine

#### TaskManager Class (Data Layer)
- Data persistence with UserDefaults
- CRUD operations for tasks
- Sample data management
- Publisher for reactive updates

## Getting Started

### Prerequisites
- Xcode 15.0 or later
- iOS 18.5 or later
- macOS 14.0 or later (for development)

### Installation
1. Clone or download the project
2. Open `TaskManager.xcodeproj` in Xcode
3. Select your target device or simulator
4. Build and run the project (⌘+R)

### Usage
1. **Adding Tasks**: Tap the + button in any tab to create a new task
2. **Editing Tasks**: Tap the pencil icon on any task to edit it
3. **Completing Tasks**: Tap the circle checkbox to mark a task as complete (not available for overdue tasks)
4. **Viewing Status**: Tasks automatically move between tabs based on their status
5. **Settings**: Tap the gear icon to access settings and data management

## Design Inspiration

The app's design is inspired by the Clarice Care Circles concept, featuring:
- **Purple and White Color Palette**: Primary purple tones with white backgrounds, matching the Clarice design aesthetic
- **Geometric Background Elements**: Subtle plus signs and circles inspired by the design's abstract shapes
- **Clean, modular layouts**: Clear sections with distinct visual separation
- **Clear visual hierarchy**: Consistent typography and spacing
- **Intuitive navigation**: Tab-based interface with clear icons
- **Accessible interface elements**: High contrast and readable text

## Future Enhancements

Potential features for future versions:
- Cloud synchronization
- Task categories/tags
- Recurring tasks
- Push notifications
- Task sharing
- Dark mode support
- Widget support

## License

This project is created for educational and demonstration purposes.

## Support

For questions or issues, please refer to the code comments or create an issue in the project repository. 