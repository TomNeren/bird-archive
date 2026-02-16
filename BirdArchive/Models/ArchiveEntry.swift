import Foundation
import SwiftData

@Model
final class ArchiveEntry {
    @Attribute(.unique) var birdId: String
    var discoveredDate: Date
    var discoveredFactIds: [String]

    init(birdId: String, discoveredDate: Date = .now, discoveredFactIds: [String] = []) {
        self.birdId = birdId
        self.discoveredDate = discoveredDate
        self.discoveredFactIds = discoveredFactIds
    }
}
