import AVFoundation
import Observation

@Observable
final class AudioEngine {
    var isPlaying = false
    var currentTime: TimeInterval = 0
    var duration: TimeInterval = 0

    private var player: AVAudioPlayer?

    func play(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "mp3", subdirectory: "Sounds") else {
            print("⚠️ Sound not found: \(sound)")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
            isPlaying = true
            duration = player?.duration ?? 0
        } catch {
            print("⚠️ Audio error: \(error)")
            isPlaying = true
            duration = 10.0
        }
    }

    func stop() {
        player?.stop()
        isPlaying = false
    }

    func toggle(sound: String) {
        if isPlaying {
            stop()
        } else {
            play(sound: sound)
        }
    }
}
