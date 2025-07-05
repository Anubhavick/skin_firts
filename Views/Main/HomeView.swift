import SwiftUI

struct HomeView: View {
    
    // --- Mock Data ---
    let mockDoctors = [
        Doctor(name: "Dr. Olivia Turner, M.D.", specialty: "Dermatologist", imageName: "doctor1", rating: 4.9, isFavorite: true),
        Doctor(name: "Dr. Alexander Brandt, Ph.D.", specialty: "General Practitioner", imageName: "doctor2", rating: 4.8, isFavorite: false),
        Doctor(name: "Dr. Michael Davisson, M.D.", specialty: "Cardiologist", imageName: "doctor3", rating: 4.7, isFavorite: false)
    ]
    
    let mockAppointments: [Appointment]
    
    init() {
        // Create mock appointments with today's date but different times
        let now = Date()
        self.mockAppointments = [
            Appointment(doctor: mockDoctors[0], date: now.addingTimeInterval(3600), type: "Consultation"),
            Appointment(doctor: mockDoctors[1], date: now.addingTimeInterval(7200), type: "Follow-up")
        ]
    }
    // -------------------

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerView
                    dateScrollerView
                    
                    Text("2 Schedules - Today")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    ForEach(mockAppointments) { appointment in
                        AppointmentCardView(appointment: appointment)
                            .padding(.horizontal)
                    }
                    
                    Text("Nearby Doctors")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)

                    ForEach(mockDoctors) { doctor in
                        let doc = doctor
                        NavigationLink(destination: DoctorDetailView(doctor: .constant(doc))) {
                            DoctorRowView(doctor: .constant(doc))
                                .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Home")
            .navigationBarHidden(true)
            .background(Color.gray.opacity(0.05).ignoresSafeArea())
        }
    }
    
    private var headerView: some View {
        HStack {
            Image("doctor1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Welcome Back,")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("John Doe")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Button(action: {}) { Image(systemName: "magnifyingglass").foregroundColor(.primary) }
            
            // --- MODIFIED PART ---
            // The bell icon is now a NavigationLink
            NavigationLink(destination: NotificationsView()) {
                Image(systemName: "bell.fill")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            .padding(.leading, 8)
        }
        .padding()
    }
    
    private var dateScrollerView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(0..<7) { day in
                    let date = Calendar.current.date(byAdding: .day, value: day, to: Date())!
                    DateView(date: date, isSelected: day == 2)
                }
            }
            .padding(.horizontal)
        }
    }
}

// ... (DateView struct remains the same) ...
struct DateView: View {
    let date: Date
    let isSelected: Bool
    
    private func formattedDate(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            Text(formattedDate(format: "EEE"))
                .font(.subheadline)
                .fontWeight(.medium)
            Text(formattedDate(format: "d"))
                .font(.title3)
                .fontWeight(.bold)
                .padding(12)
                .background(isSelected ? Color.blue : Color.clear)
                .clipShape(Circle())
                .foregroundColor(isSelected ? .white : .primary)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
        .background(isSelected ? Color.clear : Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    HomeView()
}
