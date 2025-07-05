import SwiftUI

struct WelcomeView: View {
    var body: some View {
        // NavigationStack allows us to push the Login/SignUp views
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Image("app-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                
                Text("Skin Firsts")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Dermatology Center")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                
                // NavigationLink takes the user to the LoginView
                NavigationLink(destination: LoginView()) {
                    Text("Log In")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.2, green: 0.4, blue: 1.0))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                // --- MODIFIED PART ---
                // This now navigates to our new SignUpView
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
