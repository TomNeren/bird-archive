import Foundation

struct QuizRound: Identifiable {
    let id = UUID()
    let correctBird: Bird
    let options: [Bird]
    var selectedBird: Bird?
    var isAnswered: Bool { selectedBird != nil }
    var isCorrect: Bool { selectedBird?.id == correctBird.id }
}
