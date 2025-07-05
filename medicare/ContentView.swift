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
                    // This correctly shows the MainTabView which contains our new HomeView
                    MainTabView()
                } else {
                    // If not logged in, show the Welcome/Login flow
                    WelcomeView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
