
import SwiftUI

struct AppointmentCardView: View {
    let appointment: Appointment
    
    var body: some View {
        HStack(spacing: 16) {
            Image(appointment.doctor.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(appointment.doctor.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(appointment.doctor.specialty)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(appointment.date, style: .time)
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(appointment.type)
                    .font(.caption)
                    .padding(4)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(5)
            }
        }
        .padding()
        .background(Color(.systemBackground)) // Adapts to light/dark mode
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}
