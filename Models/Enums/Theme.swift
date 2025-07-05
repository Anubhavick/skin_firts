import Foundation
import SwiftUI

// This enum represents our theme choices.
// It's CaseIterable so we can loop through all cases for our Picker.
// It's Identifiable to work with SwiftUI lists and pickers.
// Its RawValue is a String so we can save it in UserDefaults easily.
enum Theme: String, CaseIterable, Identifiable {
    case system, light, dark

    var id: Self { self }

    // This computed property converts our custom Theme enum
    // into SwiftUI's ColorScheme enum, which the system understands.
    var colorScheme: ColorScheme? {
        switch self {
        case .system:
            return nil // 'nil' tells SwiftUI to follow the device's system setting.
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
