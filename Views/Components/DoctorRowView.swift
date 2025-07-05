import SwiftUI

struct DoctorRowView: View {
    // We use @Binding so that when the user taps the heart here,
    // the original data in the main list also changes.
    @Binding var doctor: Doctor

    var body: some View {
        HStack(spacing: 16) {
            Image(doctor.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(doctor.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(doctor.specialty)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", doctor.rating))
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                }
            }
            
            Spacer()
            
            Button(action: {
                // Toggle the favorite state
                doctor.isFavorite.toggle()
            }) {
                Image(systemName: doctor.isFavorite ? "heart.fill" : "heart")
                    .font(.title2)
                    .foregroundColor(doctor.isFavorite ? .red : .gray)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

// For previewing, we need to provide a "constant" binding
#Preview {
    DoctorRowView(doctor: .constant(Doctor(name: "Dr. Olivia Turner, M.D.", specialty: "Dermatologist", imageName: "doctor1", rating: 4.9, isFavorite: true)))
        .padding()
}
