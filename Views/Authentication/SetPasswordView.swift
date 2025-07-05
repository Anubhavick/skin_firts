import SwiftUI

struct SetPasswordView: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    
    // We need access to the login state to log the user in
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Set Password")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your password must be secure and easy to remember.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Spacer()
            
            // This button finishes the process
            Button(action: {
                // In a real app, you'd validate the passwords match
                // and then make a network call to register the user.
                // For now, we'll just log them in.
                if !password.isEmpty && password == confirmPassword {
                    isLoggedIn = true
                }
            }) {
                Text("Create New Password")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.2, green: 0.4, blue: 1.0))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Set Password")
    }
}

#Preview {
    NavigationStack {
        SetPasswordView()
    }
}
