
import SwiftUI

struct HomeView: View {
    // We need access to the login state to be able to log out
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to the Home Screen!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Text("You have successfully logged in or skipped.")
                .foregroundColor(.gray)
            
            Button(action: {
                // Set isLoggedIn to false to go back to the welcome screen
                isLoggedIn = false
            }) {
                Text("Log Out")
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
