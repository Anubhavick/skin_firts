import SwiftUI

struct LoginView: View {
    // This gives us access to the shared login state
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    // State for the text fields
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Back button is handled by NavigationStack automatically
            
            Text("Welcome")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Enter your details to log in.")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            TextField("Email or Mobile Number", text: $email)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            HStack {
                Spacer()
                Button("Forgot Password?") {
                    // Action for forgot password
                }
                .font(.subheadline)
            }
            
            // --- Login Button ---
            Button(action: {
                // **IMPORTANT**: No backend, so we just check if fields are not empty.
                // In a real app, you would make a network call here.
                if !email.isEmpty && !password.isEmpty {
                    isLoggedIn = true
                }
            }) {
                Text("Log In")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.2, green: 0.4, blue: 1.0))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            // --- Skip For Now Button ---
            Button(action: {
                // This will set isLoggedIn to true, taking the user to the home screen
                isLoggedIn = true
            }) {
                Text("Skip for now")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 1.0))
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Text("Don't have an account?")
                    .font(.subheadline)
                
                // --- MODIFIED PART ---
                // This now navigates to our new SignUpView
                NavigationLink("Sign Up", destination: SignUpView())
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.bottom)
        }
        .padding()
        .navigationTitle("Log In") // Title for the navigation bar
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    // Wrap in NavigationStack for previewing
    NavigationStack {
        LoginView()
    }
}
