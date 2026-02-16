import SwiftUI

struct QuizResultView: View {
    var viewModel: QuizViewModel

    var body: some View {
        VStack {
            if let round = viewModel.currentRound {
                VStack(spacing: 15) {
                    Text(round.isCorrect ? "Richtig!" : "Falsch")
                        .font(.title)
                        .bold()
                        .foregroundColor(round.isCorrect ? .green : .red)

                    VStack(spacing: 5) {
                        Text(round.correctBird.name)
                            .font(.headline)
                        Text(round.correctBird.scientificName)
                            .font(.subheadline)
                            .italic()
                            .foregroundColor(.secondary)
                    }

                    if let fact = round.correctBird.facts.randomElement() {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(fact.title)
                                .font(.caption)
                                .bold()
                                .foregroundColor(.forestGreen)
                            Text(fact.text)
                                .font(.body)
                        }
                        .padding()
                        .background(Color.secondary.opacity(0.1))
                        .cornerRadius(10)
                    }

                    Button(action: {
                        withAnimation {
                            viewModel.nextRound()
                        }
                    }) {
                        Text("Weiter →")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.forestGreen)
                            .cornerRadius(10)
                    }
                    .padding(.top, 10)
                }
                .padding(25)
                .background(Color(.systemBackground))
                .cornerRadius(25)
                .shadow(radius: 20)
                .padding()
            }
        }
    }
}
