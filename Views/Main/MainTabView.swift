import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Tab 1: Home (No change)
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // Tab 2: Doctors (No change)
            DoctorsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Doctors")
                }
            
            // Tab 3: Chat (No change)
            Text("Chat Screen")
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chat")
                }
            
            // Tab 4: Profile (CHANGED)
            ProfileView() // Use our new ProfileView here
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(Color(red: 0.2, green: 0.4, blue: 1.0))
    }
}

#Preview {
    MainTabView()
}
