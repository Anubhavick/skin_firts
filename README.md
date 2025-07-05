# Medicare: SwiftUI Dermatology Appointment App

A fully-featured iOS application for a dermatology center, built from the ground up with SwiftUI. This project demonstrates a comprehensive understanding of modern iOS development, from UI implementation and state management to architectural best practices.

## Features

- **User Authentication:** Complete sign-up and login flows with persistent session state.
- **Doctor & Appointment Management:** Users can browse doctor profiles, book appointments through an interactive calendar, and view their appointment history (upcoming, completed, canceled).
- **Interactive Chat:** A real-time messaging interface for user-doctor communication.
- **Dynamic Theming:** A theme switcher in settings allows users to instantly choose between Light, Dark, and System appearance modes.
- **Comprehensive Profile Section:** Includes pages for editing user details, managing payment methods, and changing settings like notifications and passwords.

## Core Technologies & Concepts

This project was built to master key iOS technologies and development patterns:

- **UI Framework:** SwiftUI
- **Language:** Swift
- **Architecture:** MVVM (Model-View-ViewModel) to separate UI from business logic, creating a scalable and testable codebase.
- **State Management:**
  - `@StateObject` & `@ObservedObject` for managing the lifecycle of ViewModels.
  - `@State` & `@Binding` for local view state.
  - `@AppStorage` for persisting user settings like the selected theme.
- **Navigation:**
  - `NavigationStack` for handling deep, hierarchical navigation flows.
  - `TabView` for managing the app's main sections.
- **UI Components:**
  - Reusable views were created to ensure a consistent and maintainable UI (e.g., `DoctorRowView`, `AppointmentCardView`).
  - `Form`, `Picker`, and `Toggle` were used to build complex settings screens.
- **Asynchronous Programming:**
  - `async/await` and the `.task` modifier were used to simulate fetching data from a network, demonstrating an understanding of modern concurrency in Swift.

## How to Run

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/medicare-app.git
    ```
2.  **Open in Xcode:**
    Open the `medicare.xcodeproj` file.
3.  **Build & Run:**
    Select a target simulator and press `Cmd + R`.

## Author

**[Your Name]**

- **GitHub:** `https://github.com/your-username`
- **LinkedIn:** `https://linkedin.com/in/your-linkedin-profile`

This project represents a significant step in my journey as an iOS developer. I am passionate about building clean, efficient, and user-friendly mobile applications and am actively seeking opportunities to contribute my skills to a professional team.
