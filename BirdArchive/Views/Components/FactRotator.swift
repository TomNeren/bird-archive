import SwiftUI

struct FactRotator: View {
    let bird: Bird
    let discoveredFactIds: [String]

    @State private var currentFact: BirdFact?

    var body: some View {
        VStack {
            if let fact = currentFact {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(fact.category.rawValue)
                            .font(.caption2)
                            .bold()
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.forestGreen)
                            .foregroundColor(.white)
                            .cornerRadius(4)

                        Text(fact.title)
                            .font(.subheadline)
                            .bold()
                    }

                    Text(fact.text)
                        .font(.callout)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.forestGreen.opacity(0.1))
                .cornerRadius(12)
            }
        }
        .onAppear {
            selectRandomFact()
        }
    }

    private func selectRandomFact() {
        let undiscovered = bird.facts.filter { !discoveredFactIds.contains($0.id) }
        if let randomFact = undiscovered.randomElement() {
            currentFact = randomFact
        } else {
            currentFact = bird.facts.randomElement()
        }
    }
}
