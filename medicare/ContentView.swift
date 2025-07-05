import SwiftUI

struct ContentView: View {
    // State to manage the splash screen visibility
    @State private var showSplashScreen = true
    
    // This uses UserDefaults to remember if the user is logged in
    // so they don't have to log in every time they open the app.
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        ZStack {
            if showSplashScreen {
                SplashScreenView()
                    .onAppear {
                        // Show splash for 2.5 seconds, then hide it
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                self.showSplashScreen = false
                            }
                        }
                    }
            } else {
                // After splash, decide whether to show Auth or Home
                if isLoggedIn {
                    // *** THIS IS THE IMPORTANT CHANGE ***
                    // Instead of showing HomeView directly, we show the MainTabView,
                    // which contains the HomeView and all our other main screens.
                    MainTabView()
                } else {
                    // If not logged in, show the Welcome/Login flow
                    // We wrap this in a NavigationStack inside WelcomeView to handle navigation
                    // between Welcome, Login, and SignUp pages.
                    WelcomeView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
