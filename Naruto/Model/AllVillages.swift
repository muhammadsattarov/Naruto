



import Foundation

// MARK: - AllVillages
struct AllVillages: Codable {
    let villages: [Village]
}

// MARK: - Village
struct Village: Codable {
    let id: Int
    let name: String
    let characters: [Character]
}
