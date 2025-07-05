import SwiftUI

struct DoctorsView: View {
    // @StateObject will create and keep alive a single instance of our ViewModel
    // for the entire lifecycle of this view.
    @StateObject private var viewModel = DoctorsViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                // The search bar now binds to the viewModel's searchText property.
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search doctor, services...", text: $viewModel.searchText)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)

                // The list of doctors
                ScrollView {
                    LazyVStack(spacing: 16) {
                        // We loop over the 'filteredDoctors' from the ViewModel.
                        // We also need to get the index to create a binding.
                        ForEach(viewModel.filteredDoctors.indices, id: \.self) { index in
                            // This creates a binding to the specific doctor in the ViewModel's array.
                            let doctorBinding = $viewModel.doctors[index]
                            
                            NavigationLink(destination: DoctorDetailView(doctor: doctorBinding)) {
                                DoctorRowView(doctor: doctorBinding)
                            }
                            .buttonStyle(PlainButtonStyle())
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
