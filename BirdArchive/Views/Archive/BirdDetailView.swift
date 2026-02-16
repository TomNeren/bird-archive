import SwiftUI

struct BirdDetailView: View {
    let bird: Bird
    let entry: ArchiveEntry?

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.forestGreen.opacity(0.1))

                    Image(systemName: "bird.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(40)
                }
                .frame(height: 250)
                .padding(.horizontal)

                VStack(spacing: 5) {
                    Text(bird.name)
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                    Text(bird.scientificName)
                        .font(.title3)
                        .italic()
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Entdeckte Fakten")
                            .font(.headline)
                        Spacer()
                        Text("\(entry?.discoveredFactIds.count ?? 0) / \(bird.facts.count)")
                            .font(.subheadline)
                            .bold()
                    }

                    ProgressView(value: Double(entry?.discoveredFactIds.count ?? 0), total: Double(bird.facts.count))
                        .tint(.forestGreen)
                        .scaleEffect(x: 1, y: 1.5, anchor: .center)
                }
                .padding()
                .background(Color.secondary.opacity(0.05))
                .cornerRadius(15)
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 15) {
                    Text("Bibliothek")
                        .font(.title2)
                        .bold()
                        .padding(.leading)

                    ForEach(bird.facts) { fact in
                        let isDiscovered = entry?.discoveredFactIds.contains(fact.id) ?? false
                        FactRow(fact: fact, isDiscovered: isDiscovered)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.warmWhite.opacity(0.2))
    }
}

struct FactRow: View {
    let fact: BirdFact
    let isDiscovered: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(fact.category.rawValue)
                    .font(.caption2)
                    .bold()
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(isDiscovered ? Color.forestGreen : Color.gray.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(6)

                Text(fact.title)
                    .font(.headline)

                Spacer()
            }

            if isDiscovered {
                Text(fact.text)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                Text("Diesen Fakt hast du noch nicht entdeckt. Erkenne den Vogel erneut im Quiz, um mehr zu erfahren!")
                    .font(.caption)
                    .italic()
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}
