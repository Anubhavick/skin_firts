import SwiftUI

struct NotificationSettingsView: View {
    @State private var generalNotification = true
    @State private var sound = true
    @State private var vibrate = false
    @State private var specialOffers = true
    @State private var promoAndDiscount = false
    @State private var cashback = true

    var body: some View {
        Form {
            Section(header: Text("Notifications")) {
                Toggle("General Notification", isOn: $generalNotification)
                Toggle("Sound", isOn: $sound)
                Toggle("Vibrate", isOn: $vibrate)
            }
            
            Section(header: Text("Updates & Offers")) {
                Toggle("Special Offers", isOn: $specialOffers)
                Toggle("Promo and Discount", isOn: $promoAndDiscount)
                Toggle("Cashback", isOn: $cashback)
            }
        }
        .navigationTitle("Notification Setting")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        NotificationSettingsView()
    }
}
