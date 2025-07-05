import SwiftUI

struct ScheduleView: View {
    let doctor: Doctor
    
    @State private var selectedDate = Date()
    @State private var selectedTime: String?
    
    let timeSlots = ["09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM", "02:00 PM", "02:30 PM", "03:00 PM"]

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    DatePicker(
                        "Select a date",
                        selection: $selectedDate,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                    .accentColor(Color(red: 0.2, green: 0.4, blue: 1.0))
                    
                    Divider()
                    
                    Text("Available Time")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(timeSlots, id: \.self) { time in
                            Button(action: {
                                selectedTime = time
                            }) {
                                Text(time)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(selectedTime == time ? Color.blue : Color.gray.opacity(0.1))
                                    .foregroundColor(selectedTime == time ? .white : .primary)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding()
            }
            
            // --- MODIFIED PART ---
            // This link now navigates to the confirmation view, passing all the selected data
            NavigationLink(destination: AppointmentConfirmationView(doctor: doctor, selectedDate: selectedDate, selectedTime: selectedTime ?? "N/A")) {
                 Text("Continue")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isContinueButtonDisabled() ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
            .disabled(isContinueButtonDisabled())
        }
        .navigationTitle("Select Schedule")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func isContinueButtonDisabled() -> Bool {
        return selectedTime == nil
    }
}


