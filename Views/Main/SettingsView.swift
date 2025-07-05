import SwiftUI

struct SettingsView: View {
    // This still stores our preference as a String.
    @AppStorage("selectedTheme") private var selectedThemeRawValue: String = Theme.system.rawValue

    // --- THIS IS THE FIX ---
    // We create a custom binding that converts the String to our Theme enum and back.
    private var themeBinding: Binding<Theme> {
        Binding(
            // GET: When the Picker asks for the current value, we convert our saved String into a Theme.
            get: {
                return Theme(rawValue: self.selectedThemeRawValue) ?? .system
            },
            // SET: When the user selects a new value in the Picker, it gives us a new Theme.
            // We take its rawValue (a String) and save it to our @AppStorage variable.
            set: { newTheme in
                self.selectedThemeRawValue = newTheme.rawValue
            }
        )
    }

    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                // The Picker now uses our custom 'themeBinding'.
                Picker("Theme", selection: themeBinding) {
                    ForEach(Theme.allCases) { theme in
                        Text(theme.rawValue.capitalized)
                            .tag(theme) // The tag must be the Theme object itself.
                    }
                }
                // Using .menu picker style often looks best for this.
                .pickerStyle(.menu)
            }
            
            Section(header: Text("General")) {
                NavigationLink(destination: NotificationSettingsView()) {
                    Label("Notification Setting", systemImage: "bell.badge.fill")
                }
            }
            
            Section(header: Text("Account")) {
                NavigationLink(destination: PasswordManagerView()) {
                    Label("Password Manager", systemImage: "key.fill")
                }
                
                NavigationLink(destination: PrivacyPolicyView()) {
                    Label("Privacy Policy", systemImage: "shield.lefthalf.filled")
                }
                
                Label("Delete Account", systemImage: "trash.fill")
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
