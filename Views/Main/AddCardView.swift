import SwiftUI

struct AddCardView: View {
    @State private var cardHolderName = ""
    @State private var cardNumber = ""
    @State private var expiryDate = ""
    @State private var cvv = ""
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("CREDIT CARD")
                        .font(.caption)
                    Spacer()
                    Image(systemName: "creditcard.fill")
                        .font(.title)
                }
                
                Text(cardNumber.isEmpty ? "0000 0000 0000 0000" : cardNumber)
                    .font(.title2)
                    .monospaced()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Card Holder Name").font(.caption2)
                        Text(cardHolderName.isEmpty ? "John Doe" : cardHolderName)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Expiry Date").font(.caption2)
                        Text(expiryDate.isEmpty ? "MM/YY" : expiryDate)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [.blue, .blue.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .foregroundColor(.white)
            .cornerRadius(16)
            .padding()
            
            Form {
                Section {
                    TextField("Card Holder Name", text: $cardHolderName)
                    TextField("Card Number", text: $cardNumber)
                        .keyboardType(.numberPad)
                    TextField("Expiry Date (MM/YY)", text: $expiryDate)
                        .keyboardType(.numbersAndPunctuation)
                    TextField("CVV", text: $cvv)
                        .keyboardType(.numberPad)
                }
            }
            
            Button(action: {
                dismiss()
            }) {
                Text("Save Card")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Add Card")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AddCardView()
    }
}
