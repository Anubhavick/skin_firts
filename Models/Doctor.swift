import Foundation

struct Doctor: Identifiable {
    let id = UUID()
    let name: String
    let specialty: String
    let imageName: String
    let rating: Double // e.g., 4.9
    var isFavorite: Bool // Can be changed
}
