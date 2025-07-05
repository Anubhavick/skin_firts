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
            
            // Tab 2: My Appointments (MODIFIED)
            // This tab now shows the list of all appointments.
            NavigationStack {
                AllAppointmentsView()
            }
            .tabItem {
                Image(systemName: "calendar.badge.clock") // A more fitting icon
                Text("Appointments")
            }
            
            // Tab 3: Chat (No change)
            NavigationStack {
                ChatView()
            }
            .tabItem {
                Image(systemName: "message.fill")
                Text("Chat")
            }
            
            // Tab 4: Profile (No change)
            ProfileView()
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
