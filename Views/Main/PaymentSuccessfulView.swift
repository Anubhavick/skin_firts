
import SwiftUI

struct PaymentSuccessfulView: View {
    let doctor: Doctor
    let date: Date
    let time: String
    
    @State private var navigateToHome = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.blue)
            
            Text("Congratulations!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Payment is successfully processed. Your appointment is booked.")
                .font(.headline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text("Dr. \(doctor.name)\n\(formattedDate(date: date)) at \(time)")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

            Spacer()
            
            Button(action: {
                // This will trigger the navigation back to the root
                navigateToHome = true
            }) {
                Text("Back to Home")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
        }
        // This makes the view full screen and hides the back button
        .navigationBarBackButtonHidden(true)
        // This NavigationLink is invisible, but it will activate when navigateToHome becomes true
        .background(
            NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                EmptyView()
            }
        )
    }
    
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

#Preview {
    NavigationStack {
        PaymentSuccessfulView(
            doctor: Doctor(name: "Dr. Olivia Turner, M.D.", specialty: "Dermatologist", imageName: "doctor1", rating: 4.9, isFavorite: true),
            date: Date(),
            time: "10:30 AM"
        )
    }
}
