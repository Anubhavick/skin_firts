import SwiftUI

struct ProfileView: View {
    // We need the login state to perform the logout action
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            VStack {
                // --- User Info Header ---
                VStack(spacing: 8) {
                    Image("doctor1") // Using a placeholder image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(.top, 20)
                    
                    Text("John Doe") // Placeholder name
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 30)
                
                // --- List of Options ---
                List {
                    NavigationLink(destination: EditProfileView()) {
                        Label("Edit Profile", systemImage: "person.fill")
                    }
                    
                    NavigationLink(destination: Text("Payment Method Screen")) {
                        Label("Payment Method", systemImage: "creditcard.fill")
                    }
                    
                    NavigationLink(destination: Text("Settings Screen")) {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                    
                    NavigationLink(destination: Text("Help Center Screen")) {
                        Label("Help Center", systemImage: "questionmark.circle.fill")
                    }
                    
                    // --- Logout Button ---
                    Button(action: {
                        // This will trigger the confirmation dialog
                    }) {
                        Label("Logout", systemImage: "arrow.right.square.fill")
                            .foregroundColor(.red)
                    }
                }
                .listStyle(.plain) // Use plain style for a modern look
            }
            .navigationTitle("My Profile")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.gray.opacity(0.05).ignoresSafeArea())
        }
    }
}

#Preview {
    ProfileView()
}
