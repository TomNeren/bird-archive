import Foundation

struct SampleBirds {
    static let amsel = BirdCatalog.allBirds.first { $0.id == "amsel" }!
    static let kohlmeise = BirdCatalog.allBirds.first { $0.id == "kohlmeise" }!

    static let sampleRounds: [QuizRound] = [
        QuizRound(correctBird: amsel, options: Array(BirdCatalog.allBirds.prefix(4))),
        QuizRound(correctBird: kohlmeise, options: Array(BirdCatalog.allBirds.prefix(4)))
    ]
}
