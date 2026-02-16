import Foundation

enum Difficulty: String, Codable {
    case easy, medium, hard
}

struct Bird: Identifiable, Codable {
    let id: String
    let name: String
    let scientificName: String
    let difficulty: Difficulty
    let imageName: String
    let soundName: String
    let facts: [BirdFact]
}
