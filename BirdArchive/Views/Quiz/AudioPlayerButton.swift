import SwiftUI

struct AudioPlayerButton: View {
    let soundName: String
    @State private var audioEngine = AudioEngine()

    var body: some View {
        Button(action: {
            audioEngine.toggle(sound: soundName)
        }) {
            Circle()
                .fill(Color.orange)
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: audioEngine.isPlaying ? "pause.fill" : "play.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                )
                .shadow(radius: 5)
        }
        .onDisappear {
            audioEngine.stop()
        }
    }
}
