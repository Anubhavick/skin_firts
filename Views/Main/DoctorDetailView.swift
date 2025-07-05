import SwiftUI

struct DoctorDetailView: View {
    @Binding var doctor: Doctor
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // --- 1. Doctor Header ---
                    doctorHeaderView
                    
                    // --- 2. Stats Section ---
                    statsView
                    
                    // --- 3. About Section ---
                    aboutSection
                    
                    // --- 4. Working Time Section ---
                    workingTimeSection
                }
                .padding()
            }
            
            // --- 5. Bottom Button (MODIFIED) ---
            // This is now a NavigationLink that takes the user to the ScheduleView
            NavigationLink(destination: ScheduleView(doctor: doctor)) {
                Text("Make Appointment")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.2, green: 0.4, blue: 1.0))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    doctor.isFavorite.toggle()
                } label: {
                    Image(systemName: doctor.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(doctor.isFavorite ? .red : .gray)
                }
            }
        }
        .background(Color.gray.opacity(0.05).ignoresSafeArea())
    }
    
    // MARK: - Subviews for cleaner code
    
    private var doctorHeaderView: some View {
        HStack(spacing: 16) {
            Image(doctor.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(doctor.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(doctor.specialty)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.blue)
                    Text("Cardio Path, London")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    private var statsView: some View {
        HStack {
            StatBox(value: "100+", label: "Patients")
            StatBox(value: "10 Yrs", label: "Experience")
            StatBox(value: String(format: "%.1f", doctor.rating), label: "Rating")
        }
        .frame(maxWidth: .infinity)
    }
    
    private var aboutSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("About")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...")
                .font(.body)
                .foregroundColor(.gray)
        }
    }
    
    private var workingTimeSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Working Time")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Mon - Fri, 09:00 AM - 05:00 PM")
                .font(.body)
                .foregroundColor(.gray)
        }
    }
}

struct StatBox: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title)
                .fontWeight(.bold)
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    NavigationStack {
        DoctorDetailView(doctor: .constant(Doctor(name: "Dr. Olivia Turner, M.D.", specialty: "Dermatologist", imageName: "doctor1", rating: 4.9, isFavorite: true)))
    }
}
