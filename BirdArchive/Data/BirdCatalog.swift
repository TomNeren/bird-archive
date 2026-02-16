import Foundation

struct BirdCatalog {
    static let allBirds: [Bird] = [
        Bird(
            id: "amsel",
            name: "Amsel",
            scientificName: "Turdus merula",
            difficulty: .easy,
            imageName: "amsel",
            soundName: "amsel",
            facts: [
                BirdFact(id: "amsel_1", category: .appearance, title: "Gefieder", text: "Männchen sind schwarz mit gelbem Schnabel, Weibchen braun."),
                BirdFact(id: "amsel_2", category: .song, title: "Gesang", text: "Die Amsel beginnt ihren melodiösen Gesang oft schon in der Morgendämmerung."),
                BirdFact(id: "amsel_3", category: .habitat, title: "Lebensraum", text: "Ursprünglich ein Waldvogel, heute in fast jedem Garten zu finden."),
                BirdFact(id: "amsel_4", category: .diet, title: "Nahrung", text: "Sie fressen gerne Regenwürmer, Beeren und Insekten."),
                BirdFact(id: "amsel_5", category: .breeding, title: "Nestbau", text: "Das napfförmige Nest wird aus Zweigen, Halmen und Schlamm gebaut."),
                BirdFact(id: "amsel_6", category: .funFact, title: "Bodenjäger", text: "Amseln hüpfen am Boden und halten oft inne, um nach Beute zu lauschen.")
            ]
        ),
        Bird(
            id: "kohlmeise",
            name: "Kohlmeise",
            scientificName: "Parus major",
            difficulty: .easy,
            imageName: "kohlmeise",
            soundName: "kohlmeise",
            facts: [
                BirdFact(id: "kohl_1", category: .appearance, title: "Schwarze Krawatte", text: "Ein schwarzer Längsstreifen auf der gelben Brust ist ihr Markenzeichen."),
                BirdFact(id: "kohl_2", category: .song, title: "Ruf", text: "Ihr markanter 'zi-zi-be'-Ruf ist im Vorfrühling oft zu hören."),
                BirdFact(id: "kohl_3", category: .diet, title: "Vielseitig", text: "Sie fressen Insekten, Samen und Nüsse, besonders an Futterstellen."),
                BirdFact(id: "kohl_4", category: .habitat, title: "Anpassungsfähig", text: "Bewohnt Wälder, Gärten und Parks in ganz Europa."),
                BirdFact(id: "kohl_5", category: .breeding, title: "Höhlenbrüter", text: "Nutz gerne Nistkästen und Baumhöhlen für ihre Brut."),
                BirdFact(id: "kohl_6", category: .funFact, title: "Schlau", text: "Kohlmeisen sind sehr lernfähig und können komplexe Probleme lösen.")
            ]
        ),
        Bird(
            id: "blaumeise",
            name: "Blaumeise",
            scientificName: "Cyanistes caeruleus",
            difficulty: .medium,
            imageName: "blaumeise",
            soundName: "blaumeise",
            facts: [
                BirdFact(id: "blau_1", category: .appearance, title: "Blaues Käppchen", text: "Erkennbar an ihrem hellblauen Scheitel und den blauen Flügeln."),
                BirdFact(id: "blau_2", category: .diet, title: "Akrobat", text: "Hängt oft kopfüber an dünnen Zweigen, um Nahrung zu finden."),
                BirdFact(id: "blau_3", category: .habitat, title: "Gartenbesucher", text: "Ein sehr häufiger Gast an winterlichen Futterhäuschen."),
                BirdFact(id: "blau_4", category: .breeding, title: "Fleißig", text: "Blaumeisen füttern ihre Jungen mit tausenden kleinen Raupen."),
                BirdFact(id: "blau_5", category: .song, title: "Trillern", text: "Ihr Gesang beginnt oft mit einem hohen 'zizi' gefolgt von einem Triller."),
                BirdFact(id: "blau_6", category: .funFact, title: "Wahre Kämpfer", text: "Trotz ihrer Größe verteidigen sie ihr Nest sehr energisch.")
            ]
        ),
        Bird(
            id: "rotkehlchen",
            name: "Rotkehlchen",
            scientificName: "Erithacus rubecula",
            difficulty: .easy,
            imageName: "rotkehlchen",
            soundName: "rotkehlchen",
            facts: [
                BirdFact(id: "rot_1", category: .appearance, title: "Orange Brust", text: "Die namensgebende orange-rote Kehle ist unverwechselbar."),
                BirdFact(id: "rot_2", category: .song, title: "Perlender Gesang", text: "Ihr Gesang ist sehr variabel, wehmütig und oft bis in die Dämmerung zu hören."),
                BirdFact(id: "rot_3", category: .habitat, title: "Zutraulich", text: "Oft folgen sie Gärtnern, um im frisch umgegrabenen Boden nach Würmern zu suchen."),
                BirdFact(id: "rot_4", category: .diet, title: "Weichfutterfresser", text: "Bevorzugen Beeren, Insekten und feine Sämereien."),
                BirdFact(id: "rot_5", category: .breeding, title: "Bodenbrüter", text: "Bauen ihre Nester oft gut versteckt in Bodennähe."),
                BirdFact(id: "rot_6", category: .funFact, title: "Einzelgänger", text: "Rotkehlchen verteidigen ihr Revier das ganze Jahr über hartnäckig.")
            ]
        ),
        Bird(
            id: "buchfink",
            name: "Buchfink",
            scientificName: "Fringilla coelebs",
            difficulty: .medium,
            imageName: "buchfink",
            soundName: "buchfink",
            facts: [
                BirdFact(id: "buch_1", category: .appearance, title: "Weiße Flügelbinden", text: "Im Flug sind die zwei weißen Bänder auf den Flügeln gut zu sehen."),
                BirdFact(id: "buch_2", category: .song, title: "Finkenschlag", text: "Der schmetternde Gesang endet meist mit einem charakteristischen Schnörkel."),
                BirdFact(id: "buch_3", category: .habitat, title: "Überall", text: "Einer der häufigsten Singvögel in europäischen Wäldern und Gärten."),
                BirdFact(id: "buch_4", category: .diet, title: "Körnerfresser", text: "Sein kräftiger Schnabel ist ideal zum Knacken von Bucheckern und Samen."),
                BirdFact(id: "buch_5", category: .breeding, title: "Meisterwerk", text: "Das Nest ist extrem stabil und mit Moos und Flechten getarnt."),
                BirdFact(id: "buch_6", category: .funFact, title: "Namensgebung", text: "Der wissenschaftliche Name 'coelebs' bedeutet 'junggesellhaft'.")
            ]
        ),
        Bird(
            id: "zaunkoenig",
            name: "Zaunkönig",
            scientificName: "Troglodytes troglodytes",
            difficulty: .hard,
            imageName: "zaunkoenig",
            soundName: "zaunkoenig",
            facts: [
                BirdFact(id: "zaun_1", category: .appearance, title: "Winzling", text: "Einer der kleinsten Vögel Europas, oft mit aufgestelltem Schwanz."),
                BirdFact(id: "zaun_2", category: .song, title: "Lautstärke", text: "Trotz seiner Größe hat er einen erstaunlich lauten, schmetternden Gesang."),
                BirdFact(id: "zaun_3", category: .habitat, title: "Dickicht", text: "Liebt dichtes Unterholz, Hecken und Reisighaufen."),
                BirdFact(id: "zaun_4", category: .breeding, title: "Kugelnest", text: "Das Männchen baut mehrere Nester, aus denen das Weibchen eines wählt."),
                BirdFact(id: "zaun_5", category: .diet, title: "Insektenfresser", text: "Sucht in Ritzen und Spalten nach kleinen Insekten und Spinnen."),
                BirdFact(id: "zaun_6", category: .funFact, title: "König", text: "Der Name stammt aus einer Fabel, in der er den Adler überlistete.")
            ]
        ),
        Bird(
            id: "singdrossel",
            name: "Singdrossel",
            scientificName: "Turdus philomelos",
            difficulty: .medium,
            imageName: "singdrossel",
            soundName: "singdrossel",
            facts: [
                BirdFact(id: "sing_1", category: .appearance, title: "Gefleckte Brust", text: "Die helle Unterseite ist mit vielen dunklen, pfeilspitzenartigen Flecken übersät."),
                BirdFact(id: "sing_2", category: .song, title: "Wiederholung", text: "Ihr Gesang besteht aus verschiedenen Motiven, die meist zwei- bis dreimal wiederholt werden."),
                BirdFact(id: "sing_3", category: .diet, title: "Schneckenschmied", text: "Zertrümmert Schneckenhäuser auf Steinen, um an das Fleisch zu gelangen."),
                BirdFact(id: "sing_4", category: .habitat, title: "Wald & Park", text: "Fühlt sich in schattigen Wäldern mit viel Unterholz am wohlsten."),
                BirdFact(id: "sing_5", category: .breeding, title: "Glatte Wände", text: "Das Nest ist innen mit einer harten Schicht aus Holzmulm und Speichel ausgekleidet."),
                BirdFact(id: "sing_6", category: .funFact, title: "Frühaufsteher", text: "Gehört zu den ersten Vögeln, die am Morgen zu singen beginnen.")
            ]
        ),
        Bird(
            id: "star",
            name: "Star",
            scientificName: "Sturnus vulgaris",
            difficulty: .hard,
            imageName: "star",
            soundName: "star",
            facts: [
                BirdFact(id: "star_1", category: .appearance, title: "Metallischer Glanz", text: "Das schwarze Gefieder schimmert im Licht oft grünlich, violett und blau."),
                BirdFact(id: "star_2", category: .song, title: "Imitator", text: "Stare können andere Vögel, Umgebungsgeräusche und sogar Handys perfekt nachahmen."),
                BirdFact(id: "star_3", category: .habitat, title: "Schwarmvogel", text: "Bekannt für seine spektakulären, riesigen Flugformationen am Abendhimmel."),
                BirdFact(id: "star_4", category: .diet, title: "Allesfresser", text: "Frisst im Sommer Insekten und Würmer, im Herbst gerne Kirschen und Trauben."),
                BirdFact(id: "star_5", category: .appearance, title: "Schlichtkleid", text: "Im Winter ist sein Gefieder mit vielen weißen Punkten übersät."),
                BirdFact(id: "star_6", category: .funFact, title: "Vogel des Jahres", text: "Der Star wurde in Deutschland bereits zweimal zum Vogel des Jahres gewählt.")
            ]
        ),
        Bird(
            id: "haussperling",
            name: "Haussperling (Spatz)",
            scientificName: "Passer domesticus",
            difficulty: .easy,
            imageName: "haussperling",
            soundName: "haussperling",
            facts: [
                BirdFact(id: "spatz_1", category: .appearance, title: "Gesellig", text: "Ein kräftiger Finkenvogel, der fast immer in Gruppen anzutreffen ist."),
                BirdFact(id: "spatz_2", category: .habitat, title: "Kulturfolger", text: "Lebt seit Jahrtausenden in unmittelbarer Nähe des Menschen."),
                BirdFact(id: "spatz_3", category: .song, title: "Tschilpen", text: "Sein unermüdliches 'Tschilp-Tschilp' ist der typische Sound der Stadt."),
                BirdFact(id: "spatz_4", category: .diet, title: "Anpassungsfähig", text: "Frisst Körner, Essensreste und Insekten für die Jungenaufzucht."),
                BirdFact(id: "spatz_5", category: .breeding, title: "Nischenbrüter", text: "Baut sein Nest gerne in Mauerlöchern oder unter Dachpfannen."),
                BirdFact(id: "spatz_6", category: .funFact, title: "Staubbad", text: "Spatzen baden gerne im trockenen Staub, um Parasiten loszuwerden.")
            ]
        ),
        Bird(
            id: "gruenfink",
            name: "Grünfink",
            scientificName: "Chloris chloris",
            difficulty: .medium,
            imageName: "gruenfink",
            soundName: "gruenfink",
            facts: [
                BirdFact(id: "gruen_1", category: .appearance, title: "Massiger Schnabel", text: "Sein kräftiger, heller Schnabel ist ideal zum Knacken harter Samen."),
                BirdFact(id: "gruen_2", category: .appearance, title: "Gelbe Flügelkanten", text: "Im Flug und sitzend fallen die leuchtend gelben Kanten der Flügel auf."),
                BirdFact(id: "gruen_3", category: .song, title: "Quetschen", text: "Sein Gesang enthält oft einen charakteristischen, langgezogenen 'Krüüh'-Laut."),
                BirdFact(id: "gruen_4", category: .habitat, title: "Gartenbewohner", text: "Häufiger Gast an Futterstellen, wo er sich oft gegen andere Vögel durchsetzt."),
                BirdFact(id: "gruen_5", category: .diet, title: "Samenfresser", text: "Liebt Sonnenblumenkerne und die Samen von Hagebutten."),
                BirdFact(id: "gruen_6", category: .funFact, title: "Streitlustig", text: "Grünfinken können am Futterhaus sehr dominant und abweisend gegenüber anderen Arten sein.")
            ]
        )
    ]
}
