import Foundation

// A ViewModel should conform to ObservableObject.
// This allows SwiftUI views to "observe" or "subscribe" to any changes in it.
class DoctorsViewModel: ObservableObject {
    
    // The @Published property wrapper is crucial.
    // Whenever this 'doctors' array changes (e.g., an item is added or a favorite is toggled),
    // it automatically notifies any view that is observing this ViewModel to refresh itself.
    @Published var doctors: [Doctor] = []
    
    // We can also have state for our search text here.
    @Published var searchText = ""
    
    // In a real app, this would contain the logic to fetch doctors from a backend API.
    // For now, we'll just load our mock data here in the initializer.
    init() {
        loadDoctors()
    }
    
    func loadDoctors() {
        // This is the same mock data we had in the view before.
        self.doctors = [
            Doctor(name: "Dr. Olivia Turner, M.D.", specialty: "Dermatologist", imageName: "doctor1", rating: 4.9, isFavorite: true),
            Doctor(name: "Dr. Alexander Brandt, Ph.D.", specialty: "General Practitioner", imageName: "doctor2", rating: 4.8, isFavorite: false),
            Doctor(name: "Dr. Michael Davisson, M.D.", specialty: "Cardiologist", imageName: "doctor3", rating: 4.7, isFavorite: false),
            Doctor(name: "Dr. Sophia Martinez, Ph.D.", specialty: "Pediatrician", imageName: "doctor1", rating: 4.9, isFavorite: true),
            Doctor(name: "Dr. John Doe", specialty: "Neurologist", imageName: "doctor2", rating: 4.6, isFavorite: false)
        ]
    }
    
    // We can also move filtering logic here.
    // This computed property returns the doctors filtered by the search text.
    var filteredDoctors: [Doctor] {
        if searchText.isEmpty {
            return doctors
        } else {
            return doctors.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.specialty.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
