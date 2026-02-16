import XCTest
@testable import BirdArchive

final class BirdCatalogTests: XCTestCase {

    func testAllBirdsHaveImages() {
        for bird in BirdCatalog.allBirds {
            XCTAssertFalse(bird.imageName.isEmpty, "\(bird.name) hat keinen Image-Namen")
        }
    }

    func testAllBirdsHaveSounds() {
        for bird in BirdCatalog.allBirds {
            XCTAssertFalse(bird.soundName.isEmpty, "\(bird.name) hat keinen Sound-Namen")
        }
    }

    func testAllBirdsHaveMinimumFacts() {
        for bird in BirdCatalog.allBirds {
            XCTAssertGreaterThanOrEqual(bird.facts.count, 3,
                "\(bird.name) hat nur \(bird.facts.count) Fakten (mind. 3 nötig)")
        }
    }

    func testAssetNamingConsistency() {
        for bird in BirdCatalog.allBirds {
            XCTAssertEqual(bird.imageName, bird.id,
                "Image-Name '\(bird.imageName)' stimmt nicht mit ID '\(bird.id)' überein")
            XCTAssertEqual(bird.soundName, bird.id,
                "Sound-Name '\(bird.soundName)' stimmt nicht mit ID '\(bird.id)' überein")
        }
    }
}
