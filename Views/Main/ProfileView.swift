import SwiftUI

struct ProfileView: View {
    @State private var showingLogoutAlert = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 8) {
                    Image("doctor1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(.top, 20)
                    
                    Text("John Doe")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 30)
                
                List {
                    NavigationLink(destination: EditProfileView()) {
                        Label("Edit Profile", systemImage: "person.fill")
                    }
                    
                    NavigationLink(destination: PaymentMethodsView()) {
                        Label("Payment Method", systemImage: "creditcard.fill")
                    }
                    
                    // --- MODIFIED PART ---
                    // This now navigates to our new SettingsView
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                    
                    NavigationLink(destination: Text("Help Center Screen")) {
                        Label("Help Center", systemImage: "questionmark.circle.fill")
                    }
                    
                    Button(action: {
                        showingLogoutAlert = true
                    }) {
                        Label("Logout", systemImage: "arrow.right.square.fill")
                            .foregroundColor(.red)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("My Profile")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.gray.opacity(0.05).ignoresSafeArea())
            .alert("Logout", isPresented: $showingLogoutAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Yes, Logout", role: .destructive) {
                    isLoggedIn = false
                }
            } message: {
                Text("Are you sure you want to log out?")
            }
        }
    }
}

#Preview {
    ProfileView()
}
