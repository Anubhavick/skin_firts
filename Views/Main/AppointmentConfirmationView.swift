import SwiftUI

struct AppointmentConfirmationView: View {
    let doctor: Doctor
    let selectedDate: Date
    let selectedTime: String
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Your Appointment")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    VStack {
                        DetailRow(title: "Date & Time", value: "\(formattedDate(date: selectedDate)) at \(selectedTime)")
                        Divider()
                        DetailRow(title: "Doctor", value: doctor.name)
                        Divider()
                        DetailRow(title: "Specialty", value: doctor.specialty)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    
                    Text("Payment Details")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    VStack {
                        DetailRow(title: "Consultation", value: "$60.00")
                        Divider()
                        DetailRow(title: "Admin Fee", value: "$05.00")
                        Divider()
                        DetailRow(title: "Total", value: "$65.00", isTotal: true)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)

                    HStack {
                        Image(systemName: "creditcard.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                        Text("Credit Card **** 1234")
                        Spacer()
                        Button("Change") {}
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
            
            NavigationLink(destination: PaymentSuccessfulView(doctor: doctor, date: selectedDate, time: selectedTime)) {
                Text("Pay Now")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Review Summary")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    var isTotal: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(isTotal ? .bold : .regular)
        }
        .font(isTotal ? .headline : .body)
    }
}

#Preview {
    NavigationStack {
        // --- THIS IS THE FIX ---
        // Removed the 'id' parameter to match the struct initializer
        AppointmentConfirmationView(
            doctor: Doctor(name: "Dr. Olivia Turner", specialty: "Dermatologist", imageName: "doctor1", rating: 4.9, isFavorite: true),
            selectedDate: Date(),
            selectedTime: "10:30 AM"
        )
    }
}
