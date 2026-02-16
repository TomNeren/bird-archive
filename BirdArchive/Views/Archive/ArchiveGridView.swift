import SwiftUI
import SwiftData

struct ArchiveGridView: View {
    @Query private var entries: [ArchiveEntry]
    let birds = BirdCatalog.allBirds

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(birds) { bird in
                        let entry = entries.first { $0.birdId == bird.id }
                        NavigationLink(destination: BirdDetailView(bird: bird, entry: entry)) {
                            ArchiveBirdCard(bird: bird, isDiscovered: entry != nil)
                        }
                        .disabled(entry == nil)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Mein Archiv")
            .background(Color.warmWhite.opacity(0.3))
        }
    }
}

struct ArchiveBirdCard: View {
    let bird: Bird
    let isDiscovered: Bool

    var body: some View {
        VStack {
            ZStack {
                Image(systemName: "bird.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .background(isDiscovered ? Color.forestGreen.opacity(0.1) : Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .grayscale(isDiscovered ? 0 : 1)
                    .opacity(isDiscovered ? 1.0 : 0.5)

                if !isDiscovered {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.secondary)
                        .font(.title3)
                }
            }
            .frame(height: 100)

            Text(isDiscovered ? bird.name : "???")
                .font(.caption)
                .bold()
                .foregroundColor(isDiscovered ? .primary : .secondary)
        }
    }
}
