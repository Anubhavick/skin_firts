
import SwiftUI

struct EditProfileView: View {
    // State variables to hold the form data
    @State private var fullName = "John Doe"
    @State private var email = "johndoe@example.com"
    @State private var phoneNumber = "+123 567 8900"
    @State private var dateOfBirth = Date()
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("Full Name", text: $fullName)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                DatePicker(
                    "Date of Birth",
                    selection: $dateOfBirth,
                    displayedComponents: .date
                )
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    // In a real app, you would save the data here.
                    // For now, we just dismiss the view.
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    // We need to wrap this in a NavigationStack to see the title and button
    NavigationStack {
        EditProfileView()
    }
}
