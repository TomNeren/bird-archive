import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var quizViewModel = QuizViewModel()
    @Query private var entries: [ArchiveEntry]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        TabView {
            ZStack {
                if quizViewModel.isQuizOver {
                    QuizEndView(score: quizViewModel.score) {
                        quizViewModel.rounds = []
                        quizViewModel.isQuizOver = false
                    }
                    .transition(.opacity)
                } else if quizViewModel.rounds.isEmpty {
                    QuizStartView(viewModel: quizViewModel)
                        .transition(.opacity)
                } else {
                    QuizPlayView(viewModel: quizViewModel)
                        .transition(.opacity)
                }
            }
            .tabItem {
                Label("Quiz", systemImage: "play.circle.fill")
            }

            ArchiveGridView()
                .tabItem {
                    Label("Archiv", systemImage: "leaf.fill")
                }
        }
        .tint(.forestGreen)
        .onChange(of: quizViewModel.showResult) { oldValue, newValue in
            if newValue {
                if let round = quizViewModel.currentRound, round.isCorrect {
                    saveDiscovery(birdId: round.correctBird.id)
                }
            }
        }
    }

    private func saveDiscovery(birdId: String) {
        if let entry = entries.first(where: { $0.birdId == birdId }) {
            let bird = BirdCatalog.allBirds.first { $0.id == birdId }
            if let bird = bird {
                let undiscoveredFacts = bird.facts.filter { !entry.discoveredFactIds.contains($0.id) }
                if let newFact = undiscoveredFacts.randomElement() {
                    entry.discoveredFactIds.append(newFact.id)
                }
            }
        } else {
            let bird = BirdCatalog.allBirds.first { $0.id == birdId }
            let factId = bird?.facts.randomElement()?.id ?? ""
            let newEntry = ArchiveEntry(birdId: birdId, discoveredFactIds: [factId])
            modelContext.insert(newEntry)
        }

        try? modelContext.save()
    }
}
