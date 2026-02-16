import Foundation
import Observation

@Observable
final class QuizViewModel {
    var rounds: [QuizRound] = []
    var currentRoundIndex = 0
    var score = 0
    var isQuizOver = false
    var showResult = false
    var difficulty: Difficulty = .easy

    var currentRound: QuizRound? {
        guard currentRoundIndex < rounds.count else { return nil }
        return rounds[currentRoundIndex]
    }

    func startQuiz(difficulty: Difficulty) {
        self.difficulty = difficulty
        let allBirds = BirdCatalog.allBirds

        let pool = allBirds.filter { bird in
            switch difficulty {
            case .easy: return bird.difficulty == .easy
            case .medium: return bird.difficulty == .easy || bird.difficulty == .medium
            case .hard: return true
            }
        }

        rounds = (0..<10).map { _ in
            let correctBird = pool.randomElement() ?? allBirds.randomElement()!
            var options = [correctBird]
            while options.count < 4 {
                if let randomBird = allBirds.randomElement(), !options.contains(where: { $0.id == randomBird.id }) {
                    options.append(randomBird)
                }
            }
            return QuizRound(correctBird: correctBird, options: options.shuffled())
        }

        currentRoundIndex = 0
        score = 0
        isQuizOver = false
        showResult = false
    }

    func selectOption(_ bird: Bird) {
        guard currentRoundIndex < rounds.count, !rounds[currentRoundIndex].isAnswered else { return }
        rounds[currentRoundIndex].selectedBird = bird
        if rounds[currentRoundIndex].isCorrect {
            score += 1
        }
        showResult = true
    }

    func nextRound() {
        showResult = false
        if currentRoundIndex < rounds.count - 1 {
            currentRoundIndex += 1
        } else {
            isQuizOver = true
        }
    }
}
