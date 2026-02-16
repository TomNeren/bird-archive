import SwiftUI

struct QuizStartView: View {
    var viewModel: QuizViewModel

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Image(systemName: "bird.fill")
                .font(.system(size: 100))
                .foregroundColor(.forestGreen)

            Text("Vogelstimmen Quiz")
                .font(.largeTitle)
                .bold()

            Text("Testen Sie Ihr Wissen über heimische Vogelarten.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)

            Spacer()

            VStack(spacing: 15) {
                DifficultyButton(title: "Anfänger", difficulty: .easy, viewModel: viewModel)
                DifficultyButton(title: "Fortgeschritten", difficulty: .medium, viewModel: viewModel)
                DifficultyButton(title: "Experte", difficulty: .hard, viewModel: viewModel)
            }
            .padding(.bottom, 40)
        }
        .padding()
    }
}

struct DifficultyButton: View {
    let title: String
    let difficulty: Difficulty
    var viewModel: QuizViewModel

    var body: some View {
        Button(action: {
            withAnimation {
                viewModel.startQuiz(difficulty: difficulty)
            }
        }) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.forestGreen)
                .cornerRadius(12)
        }
    }
}
