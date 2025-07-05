import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            // Background color from your design
            Color(red: 0.2, green: 0.4, blue: 1.0)
                .ignoresSafeArea()
            
            VStack {
                // Use the logo you added to Assets
                Image("app-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Text("Skin Firts") // Note: The design says "Firts", correcting to "Firsts"
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Dermatology Center")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
