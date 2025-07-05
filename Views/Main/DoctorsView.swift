import SwiftUI

struct DoctorsView: View {
    // @State allows us to modify this data, e.g., toggling a favorite
    @State private var doctors: [Doctor] = [
        Doctor(name: "Dr. Olivia Turner, M.D.", specialty: "Dermatologist", imageName: "doctor1", rating: 4.9, isFavorite: true),
        Doctor(name: "Dr. Alexander Brandt, Ph.D.", specialty: "General Practitioner", imageName: "doctor2", rating: 4.8, isFavorite: false),
        Doctor(name: "Dr. Michael Davisson, M.D.", specialty: "Cardiologist", imageName: "doctor3", rating: 4.7, isFavorite: false),
        Doctor(name: "Dr. Sophia Martinez, Ph.D.", specialty: "Pediatrician", imageName: "doctor1", rating: 4.9, isFavorite: true),
        Doctor(name: "Dr. John Doe", specialty: "Neurologist", imageName: "doctor2", rating: 4.6, isFavorite: false)
    ]
    
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search doctor, services...", text: $searchText)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)

                // The list of doctors
                ScrollView {
                    LazyVStack(spacing: 16) {
                        // We use $doctor to create a binding for DoctorRowView
                        ForEach($doctors) { $doctor in
                            // MODIFIED PART: The destination is now the DoctorDetailView
                            NavigationLink(destination: DoctorDetailView(doctor: $doctor)) {
                                DoctorRowView(doctor: $doctor)
                            }
                            .buttonStyle(PlainButtonStyle()) // Removes blue tint from text
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Doctors")
            .background(Color.gray.opacity(0.05).ignoresSafeArea())
        }
    }
}

#Preview {
    DoctorsView()
}
