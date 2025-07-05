import SwiftUI

struct PaymentMethodsView: View {
    var body: some View {
        List {
            Section(header: Text("Credit & Debit Card")) {
                HStack {
                    Image(systemName: "creditcard.fill")
                    Text("**** **** **** 1234")
                }
            }
            
            Section(header: Text("Other Options")) {
                HStack {
                    Image("applepay-logo") // Ensure this logo is in your Assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 24)
                    Text("Apple Pay")
                }
                HStack {
                    Image("googlepay-logo") // Ensure this logo is in your Assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 24)
                    Text("Google Pay")
                }
            }
            
            NavigationLink(destination: AddCardView()) {
                Label("Add New Card", systemImage: "plus.circle.fill")
            }
        }
        .navigationTitle("Payment Method")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PaymentMethodsView()
    }
}
