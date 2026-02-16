import SwiftUI

struct ScoreStars: View {
    let score: Int

    var body: some View {
        HStack(spacing: 12) {
            ForEach(1...3, id: \.self) { index in
                Image(systemName: index <= starCount ? "star.fill" : "star")
                    .font(.system(size: 40))
                    .foregroundColor(index <= starCount ? .orange : .gray.opacity(0.3))
                    .shadow(color: index <= starCount ? .orange.opacity(0.4) : .clear, radius: 5)
            }
        }
        .padding()
    }

    private var starCount: Int {
        if score == 10 { return 3 }
        if score >= 7 { return 2 }
        if score >= 4 { return 1 }
        return 0
    }
}
