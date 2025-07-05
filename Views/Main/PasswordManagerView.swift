import SwiftUI

struct PasswordManagerView: View {
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmNewPassword = ""
    
    var body: some View {
        Form {
            Section(header: Text("Change Password")) {
                SecureField("Current Password", text: $currentPassword)
                SecureField("New Password", text: $newPassword)
                SecureField("Confirm New Password", text: $confirmNewPassword)
            }
            
            Button("Change Password") {
                // Action to change the password would go here
            }
            .tint(.blue)
        }
        .navigationTitle("Password Manager")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PasswordManagerView()
    }
}
