import Foundation

// This represents a scheduled appointment.
struct Appointment: Identifiable {
    let id = UUID()
    let doctor: Doctor
    let date: Date
    let type: String
}
