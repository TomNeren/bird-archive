import SwiftUI

struct BirdChoiceCard: View {
    let bird: Bird
    let isSelected: Bool
    let isCorrect: Bool
    let showResult: Bool
    let showName: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                ZStack {
                    Image(systemName: "bird.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(20)
                        .background(Color.secondary.opacity(0.1))
                        .cornerRadius(12)

                    if showResult {
                        if isCorrect {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.green, lineWidth: 4)
                        } else if isSelected {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.red, lineWidth: 4)
                        }
                    }
                }
                .frame(minHeight: 120)

                if showName || (showResult && isCorrect) {
                    Text(bird.name)
                        .font(.caption)
                        .bold()
                        .lineLimit(1)
                        .foregroundColor(.primary)
                } else {
                    Text("???")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .disabled(showResult)
    }
}
