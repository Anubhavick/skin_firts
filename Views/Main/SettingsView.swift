import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
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
                
                // You can add more links here later, like "Delete Account"
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
