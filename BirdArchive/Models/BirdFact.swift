import Foundation

enum FactCategory: String, Codable, CaseIterable {
    case appearance = "Aussehen"
    case habitat = "Lebensraum"
    case song = "Gesang & Rufe"
    case breeding = "Brutverhalten"
    case diet = "Nahrung"
    case funFact = "Fun Fact"
    case conservation = "Schutzstatus"
}

struct BirdFact: Identifiable, Codable {
    let id: String
    let category: FactCategory
    let title: String
    let text: String
}
