# AGENTS.md — Bird Archive: Vogelstimmen-Quiz

> **Für Jules (GitHub Copilot Coding Agent)**
> Lies diese Datei vollständig bevor du irgendetwas tust.

---

## 🎯 Projektziel

Eine native iOS/macOS-App (Universal) als **Vogelstimmen-Quiz** mit Sammelkarten-Mechanik.
Spieler hören Vogelgesänge und identifizieren die richtige Art. Über die Zeit füllt sich ein
persönliches **Archiv** — ein digitales Bestimmungsbuch.

---

## 🏛️ Die Philosophie: Bau eines digitalen Vogel-Archivs

Stell dir vor, du baust nicht nur ein Spiel. Du baust ein **digitales Archiv für Vögel**.
Das Spiel ist nur die erste, unterhaltsame Art, dieses Archiv zu nutzen.
Diese Denkweise hilft uns, die App sauber und professionell zu strukturieren.

Unser Archiv hat vier zentrale Komponenten:

1. **Die Archivkarte (`Model`):** Die einzige Quelle der Wahrheit für einen Vogel.
   Jede Karte ist ein komplettes Set: ID, Name, Bild und Ton.
   **Eine unvollständige Karte ist unmöglich** — das erzwingen wir durch Typisierung.

2. **Der Archivschrank (`Persistence / SwiftData`):** Hier werden alle Archivkarten
   sicher und dauerhaft aufbewahrt. Er speichert den Spielstand, erkannte Arten
   und welche Fakten bereits entdeckt wurden.

3. **Der Archivar (`ViewModel`):** Das Gehirn der App. Er ist der Einzige, der direkt
   mit dem Archivschrank arbeitet. Er kennt die Spielregeln, bereitet Quiz-Runden
   vor und wertet Antworten aus.

4. **Die Ausstellungshalle (`View / SwiftUI`):** Die Benutzeroberfläche. Schön und
   interaktiv, aber "dumm". Sie fragt den Archivar, was sie anzeigen soll, und
   meldet ihm die Aktionen des Nutzers.

Diese Trennung ist das Geheimnis professioneller Apps.

---

## 🏗️ Technischer Stack

| Komponente | Technologie | Hinweis |
|---|---|---|
| UI | **SwiftUI** (iOS 26+) | Liquid Glass Design nutzen |
| 3D (Phase 2) | **RealityKit** + USDZ | Nicht in Phase 1 |
| Audio | **AVFoundation** (`AVAudioPlayer`) | Lokale MP3/M4A aus Bundle |
| Daten | **SwiftData** | Für Spielstand, Archiv, Lernfortschritt |
| Target | iOS 18+ / macOS 15+ | Universal App |
| Sprache | **Swift 6** | Strict Concurrency |
| Package Manager | **SPM** | Keine CocoaPods/Carthage |

---

## 📁 Projektstruktur

```
BirdArchive/
├── BirdArchive.xcodeproj
├── BirdArchive/
│   ├── BirdArchiveApp.swift              # Entry Point
│   ├── Models/
│   │   ├── Bird.swift                     # Vogel-Datenmodell
│   │   ├── BirdFact.swift                 # Fakten-Kategorien
│   │   ├── QuizRound.swift                # Quiz-Runde
│   │   └── ArchiveEntry.swift             # SwiftData: Sammlungseintrag
│   ├── Data/
│   │   ├── BirdCatalog.swift              # Statischer Vogelkatalog
│   │   └── SampleBirds.swift              # Preview-Daten
│   ├── ViewModels/
│   │   ├── QuizViewModel.swift            # Quiz-Spiellogik
│   │   └── ArchiveViewModel.swift         # Archiv/Sammlung
│   ├── Views/
│   │   ├── ContentView.swift              # Tab-Navigation
│   │   ├── Quiz/
│   │   │   ├── QuizStartView.swift        # Startbildschirm
│   │   │   ├── QuizPlayView.swift         # Hauptspiel
│   │   │   ├── BirdChoiceCard.swift       # Auswahlkarte (Bild + Name)
│   │   │   ├── AudioPlayerButton.swift    # Play/Pause-Button
│   │   │   ├── QuizResultView.swift       # Ergebnis nach Antwort
│   │   │   └── QuizEndView.swift          # Endbildschirm mit Score
│   │   ├── Archive/
│   │   │   ├── ArchiveGridView.swift      # Sammlungsübersicht
│   │   │   └── BirdDetailView.swift       # Einzelne Vogelkarte (rotierend)
│   │   └── Components/
│   │       ├── FactRotator.swift          # Zeigt zufälligen Fakt
│   │       └── ScoreStars.swift           # Sterne-Anzeige
│   ├── Services/
│   │   └── AudioEngine.swift              # AVFoundation-Wrapper
│   └── Resources/
│       ├── Assets.xcassets/
│       │   ├── AppIcon.appiconset/
│       │   └── Birds/                     # Bird Image Sets
│       └── Sounds/                        # Bird Audio Files (MP3/M4A)
├── BirdArchiveTests/
│   └── BirdCatalogTests.swift             # Validierung: jeder Vogel hat Bild+Audio
├── AGENTS.md                              # Diese Datei
└── README.md
```

---

## 🐦 Vogelkatalog — Phase 1 (10 heimische Arten)

Jeder Vogel hat folgende Datenstruktur:

```swift
struct Bird: Identifiable, Codable {
    let id: String              // z.B. "amsel"
    let name: String            // "Amsel"
    let scientificName: String  // "Turdus merula"
    let difficulty: Difficulty   // .easy, .medium, .hard
    let imageName: String       // Asset-Name in xcassets
    let soundName: String       // Dateiname in Sounds/
    let facts: [BirdFact]       // Array von Fakten-Kategorien
}

struct BirdFact: Identifiable, Codable {
    let id: String
    let category: FactCategory  // .appearance, .habitat, .song, .breeding, .diet, .funFact, .conservation
    let title: String
    let text: String
}

enum FactCategory: String, Codable, CaseIterable {
    case appearance = "Aussehen"
    case habitat = "Lebensraum"
    case song = "Gesang & Rufe"
    case breeding = "Brutverhalten"
    case diet = "Nahrung"
    case funFact = "Fun Fact"
    case conservation = "Schutzstatus"
}

enum Difficulty: String, Codable {
    case easy, medium, hard
}
```

### Die 10 Startvögel

| ID | Name | Schwierigkeit |
|---|---|---|
| amsel | Amsel | easy |
| kohlmeise | Kohlmeise | easy |
| blaumeise | Blaumeise | medium |
| rotkehlchen | Rotkehlchen | easy |
| buchfink | Buchfink | medium |
| zaunkoenig | Zaunkönig | hard |
| singdrossel | Singdrossel | medium |
| star | Star | hard |
| haussperling | Haussperling (Spatz) | easy |
| gruenfink | Grünfink | medium |

**WICHTIG:** Für jeden Vogel müssen folgende Assets existieren:
- `Assets.xcassets/Birds/{id}.imageset/` — Foto des Vogels (mind. 800px)
- `Sounds/{id}.mp3` — Gesangsaufnahme (10-30 Sek., gute Qualität)

Da wir in Phase 1 noch keine generierten Bilder haben, verwende **Placeholder-Assets**:
- Erstelle für jedes Bird-Image-Set ein SF Symbol Placeholder (`bird.fill`)
- Für Audio: Erstelle leere Placeholder-Dateien mit Kommentar
- Die App muss **ohne Crashes** laufen auch mit Placeholders

---

## 🎮 Spielmechanik

### Quiz-Flow
1. **Start:** Willkommen-Screen mit "Quiz starten"-Button
2. **Runde (10x):**
   - Vogelstimme wird abgespielt (Play-Button, beliebig oft wiederholbar)
   - 4 Auswahlkarten (1 richtig, 3 falsch) als Grid (2×2)
   - Spieler tippt auf eine Karte
   - Richtig → grüner Rahmen, Konfetti-Effekt, +1 Punkt
   - Falsch → roter Rahmen auf Auswahl, grüner auf richtige Antwort
   - **Ergebnis-Panel:** Vogelname + wissenschaftl. Name + **ein zufälliger Fakt** (rotierend!)
   - "Weiter →" Button
3. **Ende:** Gesamtpunktzahl, Sterne (0-3), ermutigende Nachricht, "Nochmal"-Button

### Archiv-Mechanik
- Jeder korrekt erkannte Vogel wird ins **Archiv** aufgenommen (SwiftData)
- Archiv zeigt Grid aller Vögel: erkannte bunt, unerkannte ausgegraut/silhouette
- Tap auf erkannten Vogel → **BirdDetailView** mit allen bisher gesehenen Fakten
- Fakten-Fortschritt: "4/7 Fakten entdeckt" mit Fortschrittsbalken
- **Neue Fakten** werden bei jeder erneuten korrekten Erkennung freigeschaltet

### Schwierigkeitsstufen
- **Anfänger:** Nur easy-Vögel, Vogelnamen unter den Bildern
- **Fortgeschritten:** Easy + Medium, keine Namen
- **Experte:** Alle Vögel, keine Namen, kürzere Audio-Snippets

---

## 🔊 AudioEngine

```swift
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
```

---

## 🧪 Tests

### BirdCatalogTests

```swift
import XCTest
@testable import BirdArchive

final class BirdCatalogTests: XCTestCase {
    
    /// Jeder Vogel im Katalog muss ein Bild-Asset haben
    func testAllBirdsHaveImages() {
        for bird in BirdCatalog.allBirds {
            let image = UIImage(named: bird.imageName)
            // In Phase 1 dürfen Placeholders nil sein, aber der Name muss gesetzt sein
            XCTAssertFalse(bird.imageName.isEmpty, "\(bird.name) hat keinen Image-Namen")
        }
    }
    
    /// Jeder Vogel muss eine Sound-Datei referenzieren
    func testAllBirdsHaveSounds() {
        for bird in BirdCatalog.allBirds {
            XCTAssertFalse(bird.soundName.isEmpty, "\(bird.name) hat keinen Sound-Namen")
        }
    }
    
    /// Jeder Vogel muss mindestens 3 Fakten haben
    func testAllBirdsHaveMinimumFacts() {
        for bird in BirdCatalog.allBirds {
            XCTAssertGreaterThanOrEqual(bird.facts.count, 3,
                "\(bird.name) hat nur \(bird.facts.count) Fakten (mind. 3 nötig)")
        }
    }
    
    /// Bild-ID und Sound-ID müssen mit der Bird-ID übereinstimmen
    func testAssetNamingConsistency() {
        for bird in BirdCatalog.allBirds {
            XCTAssertEqual(bird.imageName, bird.id,
                "Image-Name '\(bird.imageName)' stimmt nicht mit ID '\(bird.id)' überein")
            XCTAssertEqual(bird.soundName, bird.id,
                "Sound-Name '\(bird.soundName)' stimmt nicht mit ID '\(bird.id)' überein")
        }
    }
}
```

---

## 📋 Arbeitsschritte für Jules

### ⚠️ KRITISCH: Push-Anweisungen

**Nach JEDEM abgeschlossenen Schritt:**
```bash
git add -A
git commit -m "Step X: [Beschreibung]"
git push origin main
```

**NIEMALS** Arbeit nur lokal lassen. Jeder Commit muss gepusht werden.
Am Ende jeder Session: `git push origin main` als letzte Aktion.

### Phase 1: Grundgerüst (MVP)

**Step 1: Xcode-Projekt erstellen**
- Neues SwiftUI App Projekt "BirdArchive"
- Target: iOS 18+, macOS 15+
- Ordnerstruktur gemäß Projektstruktur oben anlegen
- `git add -A && git commit -m "Step 1: Xcode project setup" && git push origin main`

**Step 2: Datenmodell**
- `Bird.swift`, `BirdFact.swift`, `FactCategory` enum implementieren
- `ArchiveEntry.swift` als SwiftData Model (@Model)
- `BirdCatalog.swift` mit allen 10 Vögeln + je 5-7 Fakten (auf Deutsch!)
- `git add -A && git commit -m "Step 2: Data models and bird catalog" && git push origin main`

**Step 3: AudioEngine**
- `AudioEngine.swift` implementieren (siehe Vorlage oben)
- Placeholder-Sounds erstellen (leere Dateien oder kurze Stille)
- `git add -A && git commit -m "Step 3: Audio engine" && git push origin main`

**Step 4: Quiz-Views**
- `QuizStartView`, `QuizPlayView`, `QuizResultView`, `QuizEndView`
- `BirdChoiceCard` als 2×2 Grid
- `AudioPlayerButton` mit Play/Pause-Animation
- `QuizViewModel` mit Spiellogik
- `git add -A && git commit -m "Step 4: Quiz views and game logic" && git push origin main`

**Step 5: Archiv-Views**
- `ArchiveGridView` — Grid aller Vögel (erkannt/nicht erkannt)
- `BirdDetailView` — Einzelansicht mit Fakten
- `FactRotator` — zeigt zufälligen noch nicht gesehenen Fakt
- `ArchiveViewModel` mit SwiftData-Queries
- `git add -A && git commit -m "Step 5: Archive views" && git push origin main`

**Step 6: Navigation & Polish**
- `ContentView` mit TabView (Quiz / Archiv)
- App Icon (SF Symbol based Placeholder)
- Animationen: Card-Flip, Konfetti bei richtiger Antwort
- Haptic Feedback bei Antwort
- `git add -A && git commit -m "Step 6: Navigation and polish" && git push origin main`

**Step 7: Tests**
- `BirdCatalogTests` implementieren (siehe oben)
- Sicherstellen dass alle Tests grün sind
- `git add -A && git commit -m "Step 7: Tests" && git push origin main`

### Alternative: Der "Feierabend-Knopf" (submit.sh)

Statt manuell git-Befehle einzugeben, kannst du auch das `submit.sh`-Script nutzen:
```bash
chmod +x submit.sh  # Einmalig
./submit.sh "Step 4: Quiz views and game logic"
```
Es baut das Projekt, committed und pusht automatisch. Schlägt der Build fehl,
wird NICHT gepusht — so bleibt das Repo immer funktionsfähig.

### Phase 2: Assets (separat, nicht von Jules)

**Bilder:** Werden extern generiert mit konsistentem Prompt:
```
Generate a photorealistic, high-resolution image of a [Vogelart].
Style: Digital painting, detailed feathers, scientifically accurate proportions.
Pose: The bird is perched on a [branch/fence/etc.], viewed from the side to show its full profile.
Background: Plain white, studio quality.
Lighting: Bright, natural light, emphasizing the bird's colors.
Format: Square aspect ratio, 1024x1024, suitable for an app card.
```

**Audio:** Xeno-Canto (Creative Commons), 10-30 Sek. Gesangsaufnahme pro Art.

### Phase 3: 3D & KI (Zukunft)
- **RealityKit** + USDZ-Vogelmodelle (animiert)
- **Apple Foundation Models** für dynamische Fakten (on-device, offline)
- Saisonaler Modus (Frühling: Balzgesänge, Winter: Kontaktrufe)
- Standort-Feature (CoreLocation + Zugvogel-Datenbank)
- Duell-Modus (2 Spieler, wer erkennt schneller?)
- Sound-Spektrogramm-Visualisierung

---

## 🎨 Design-Richtlinien

- **Liquid Glass** wo möglich (Standard-SwiftUI-Komponenten nutzen)
- Farbpalette: Waldgrün (#2d5016) + Warmweiß (#fffef5) + Orange-Akzent (#ff9800)
- Schrift: System-Font (San Francisco)
- Animationen: subtil, natürlich — keine überladenen Effekte
- Dark Mode: vollständig unterstützen
- Barrierefreiheit: VoiceOver-Labels für alle interaktiven Elemente

---

## 🚫 Was Jules NICHT tun soll

- Keine externen Dependencies (kein Firebase, kein Alamofire, nichts)
- Keine Netzwerk-Calls (alles lokal aus Bundle)
- Keine Bilder oder Audio aus dem Internet laden
- Kein UIKit verwenden (nur SwiftUI)
- Keine Arbeit lokal lassen — IMMER pushen
- Keinen Code generieren der nicht kompiliert

---

## ✅ Definition of Done (Phase 1)

- [ ] App startet ohne Crash auf iOS Simulator
- [ ] Quiz mit 10 Runden spielbar (auch mit Placeholder-Assets)
- [ ] Audio-Playback funktioniert (oder graceful fallback bei Placeholder)
- [ ] Archiv zeigt erkannte Vögel
- [ ] Fakten rotieren bei wiederholtem Besuch
- [ ] Alle Tests grün
- [ ] Alle Änderungen gepusht auf `main`
- [ ] README.md mit Projektbeschreibung

---

*Erstellt von Aether & Janus für Tom — 2026-02-15*
