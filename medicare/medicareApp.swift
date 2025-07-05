import SwiftUI

@main
struct medicareApp: App {
    // We use @AppStorage to read the user's saved theme.
    // "selectedTheme" is the key in UserDefaults.
    // If nothing is saved, it will default to the system setting.
    @AppStorage("selectedTheme") private var selectedTheme: String = Theme.system.rawValue

    var body: some Scene {
        WindowGroup {
            ContentView()
                // This modifier applies the chosen color scheme to the entire app.
                // We convert our saved String back into a Theme enum to get the ColorScheme.
                .preferredColorScheme(Theme(rawValue: selectedTheme)?.colorScheme)
        }
    }
}
