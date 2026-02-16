import Foundation
import SwiftData
import Observation

@Observable
final class ArchiveViewModel {
    var entries: [ArchiveEntry] = []

    func isBirdDiscovered(birdId: String, in entries: [ArchiveEntry]) -> Bool {
        entries.contains { $0.birdId == birdId }
    }

    func entryForBird(birdId: String, in entries: [ArchiveEntry]) -> ArchiveEntry? {
        entries.first { $0.birdId == birdId }
    }
}
