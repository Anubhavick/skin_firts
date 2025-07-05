import SwiftUI

// Enum to manage the selected tab
enum AppointmentStatus {
    case upcoming, completed, canceled
}

struct AllAppointmentsView: View {
    @State private var selectedStatus: AppointmentStatus = .upcoming

    var body: some View {
        VStack {
            // Custom Tab Picker
            Picker("Status", selection: $selectedStatus) {
                Text("Upcoming").tag(AppointmentStatus.upcoming)
                Text("Completed").tag(AppointmentStatus.completed)
                Text("Canceled").tag(AppointmentStatus.canceled)
            }
            .pickerStyle(.segmented)
            .padding()

            // Content that changes based on the selected tab
            switch selectedStatus {
            case .upcoming:
                AppointmentListView(status: .upcoming)
            case .completed:
                AppointmentListView(status: .completed)
            case .canceled:
                AppointmentListView(status: .canceled)
            }
            
            Spacer()
        }
        .navigationTitle("My Appointments")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// A reusable list view that shows appointments and action buttons
struct AppointmentListView: View {
    let status: AppointmentStatus

    // Mock data for demonstration
    let upcomingAppointments: [Appointment] = [
        Appointment(doctor: Doctor(name: "Dr. Olivia Turner", specialty: "Dermatologist", imageName: "doctor1", rating: 4.9, isFavorite: true), date: Date().addingTimeInterval(86400 * 2), type: "Consultation"),
        Appointment(doctor: Doctor(name: "Dr. Alexander Brandt", specialty: "General Practitioner", imageName: "doctor2", rating: 4.8, isFavorite: false), date: Date().addingTimeInterval(86400 * 5), type: "Follow-up")
    ]
    let completedAppointments: [Appointment] = [
        Appointment(doctor: Doctor(name: "Dr. Michael Davisson", specialty: "Cardiologist", imageName: "doctor3", rating: 4.7, isFavorite: false), date: Date().addingTimeInterval(-86400 * 7), type: "Check-up")
    ]
    
    var body: some View {
        let appointments = (status == .upcoming) ? upcomingAppointments : (status == .completed ? completedAppointments : [])

        if appointments.isEmpty {
            VStack {
                Spacer()
                Text("No \(status == .upcoming ? "upcoming" : (status == .completed ? "completed" : "canceled")) appointments.")
                    .foregroundColor(.gray)
                Spacer()
            }
        } else {
            List(appointments) { appointment in
                VStack(alignment: .leading, spacing: 16) {
                    AppointmentCardView(appointment: appointment) // Reusing our component!
                    
                    HStack {
                        Spacer()
                        if status == .upcoming {
                            Button("Cancel Appointment") { /* Action */ }
                                .buttonStyle(.bordered)
                                .tint(.red)
                        } else if status == .completed {
                             Button("Add Review") { /* Action */ }
                                .buttonStyle(.borderedProminent)
                                .tint(.blue)
                        }
                        Spacer()
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.vertical, 8)
            }
            .listStyle(.plain)
        }
    }
}


#Preview {
    NavigationStack {
        AllAppointmentsView()
    }
}
