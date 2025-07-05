import SwiftUI

struct SignUpView: View {
    // State for the form fields
    @State private var fullName = ""
    @State private var email = ""
    @State private var mobileNumber = ""
    @State private var dateOfBirth = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Create New Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            TextField("Full name", text: $fullName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            TextField("Mobile Number", text: $mobileNumber)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .keyboardType(.phonePad)
                
            DatePicker(
                "Date Of Birth",
                 selection: $dateOfBirth,
                 displayedComponents: .date
            )
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            Spacer()
            
            // This button will navigate to the next step: SetPasswordView
            NavigationLink(destination: SetPasswordView()) {
                Text("Sign Up")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.2, green: 0.4, blue: 1.0))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            HStack {
                Spacer()
                Text("Already have an account?")
                    .font(.subheadline)
                
                // This would pop the view, going back to the LoginView
                Button("Log In") {
                    // Action to go back to login
                }
                .fontWeight(.bold)
                Spacer()
            }
            .padding(.bottom)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("New Account")
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
