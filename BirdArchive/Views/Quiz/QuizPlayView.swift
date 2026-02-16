import SwiftUI

struct QuizPlayView: View {
    var viewModel: QuizViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Runde \(viewModel.currentRoundIndex + 1) / 10")
                    .font(.headline)
                Spacer()
                Text("Score: \(viewModel.score)")
                    .font(.headline)
            }
            .padding()

            Spacer()

            if let round = viewModel.currentRound {
                AudioPlayerButton(soundName: round.correctBird.soundName)
                    .padding(.bottom, 40)
                    .id(round.id)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(round.options) { bird in
                        BirdChoiceCard(
                            bird: bird,
                            isSelected: round.selectedBird?.id == bird.id,
                            isCorrect: bird.id == round.correctBird.id,
                            showResult: viewModel.showResult,
                            showName: viewModel.difficulty == .easy,
                            action: {
                                withAnimation {
                                    viewModel.selectOption(bird)
                                }
                            }
                        )
                    }
                }
                .padding()
            }

            Spacer()

            if viewModel.showResult {
                QuizResultView(viewModel: viewModel)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}
