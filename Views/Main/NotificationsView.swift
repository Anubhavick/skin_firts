import SwiftUI

// A simple model for a notification item
struct NotificationItem: Identifiable {
    let id = UUID()
    let iconName: String
    let iconColor: Color
    let title: String
    let subtitle: String
    let date: String
}

struct NotificationsView: View {
    // Mock data for the notification list
    let notifications: [NotificationItem] = [
        NotificationItem(iconName: "calendar", iconColor: .blue, title: "Scheduled Appointment", subtitle: "You have an appointment with Dr. Turner on April 12.", date: "Today"),
        NotificationItem(iconName: "xmark.circle.fill", iconColor: .red, title: "Scheduled Change", subtitle: "Your appointment for April 15 has been cancelled.", date: "Yesterday"),
        NotificationItem(iconName: "doc.text.fill", iconColor: .green, title: "Medical Notes", subtitle: "Your recent lab results are available to view.", date: "April 10"),
        NotificationItem(iconName: "heart.text.square.fill", iconColor: .orange, title: "Medical History Update", subtitle: "Your medical history has been updated by your GP.", date: "April 9")
    ]
    
    var body: some View {
        List(notifications) { notification in
            HStack(spacing: 16) {
                Image(systemName: notification.iconName)
                    .font(.title)
                    .foregroundColor(notification.iconColor)
                    .frame(width: 40)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(notification.title)
                        .fontWeight(.bold)
                    Text(notification.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                
                Spacer()
                
                Text(notification.date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
        }
        .listStyle(.plain)
        .navigationTitle("Notification")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        NotificationsView()
    }
}
