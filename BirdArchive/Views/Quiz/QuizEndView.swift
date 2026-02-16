import SwiftUI

struct QuizEndView: View {
    let score: Int
    let action: () -> Void

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Text("Quiz Beendet")
                .font(.largeTitle)
                .bold()

            VStack(spacing: 10) {
                Text("Deine Punktzahl")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text("\(score) / 10")
                    .font(.system(size: 60, weight: .black))
                    .foregroundColor(.forestGreen)
            }

            HStack {
                ForEach(0..<3) { index in
                    Image(systemName: index < starCount ? "star.fill" : "star")
                        .font(.title)
                        .foregroundColor(.orange)
                }
            }

            Text(encouragingMessage)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            Button(action: action) {
                Text("Nochmal spielen")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.forestGreen)
                    .cornerRadius(12)
            }
            .padding(.bottom, 40)
        }
        .padding()
    }

    private var starCount: Int {
        if score == 10 { return 3 }
        if score >= 7 { return 2 }
        if score >= 4 { return 1 }
        return 0
    }

    private var encouragingMessage: String {
        if score == 10 { return "Perfekt! Du bist ein wahrer Vogeleperte!" }
        if score >= 7 { return "Super Leistung! Du kennst dich richtig gut aus." }
        if score >= 4 { return "Guter Anfang! Übe weiter, um noch mehr Stimmen zu erkennen." }
        return "Bleib dran! Die Natur hat noch viel zu bieten."
    }
}
