class Chord {
  final String chordName;
  final String assetImagePath;
  Chord({required this.chordName, required this.assetImagePath});
}

List<Chord> allChords = [
  Chord(chordName: 'A', assetImagePath: 'assets/chords/A.png'),
  Chord(chordName: 'Am', assetImagePath: 'assets/chords/Am.png'),
  Chord(chordName: 'A+', assetImagePath: 'assets/chords/A+.png'),
  Chord(chordName: 'B', assetImagePath: 'assets/chords/B.png'),
  Chord(chordName: 'C', assetImagePath: 'assets/chords/C.png'),
  Chord(chordName: 'Cm', assetImagePath: 'assets/chords/Cm.png'),
  Chord(chordName: 'C7', assetImagePath: 'assets/chords/C7.png'),
  Chord(chordName: 'Cm7', assetImagePath: 'assets/chords/Cm7.png'),
  Chord(chordName: 'C+', assetImagePath: 'assets/chords/C+.png'),
  Chord(chordName: 'Cadd9', assetImagePath: 'assets/chords/Cadd9.png'),
  Chord(chordName: 'Cm6add9', assetImagePath: 'assets/chords/Cm6add9.png'),
  Chord(chordName: 'Dm', assetImagePath: 'assets/chords/Dm.png'),
  Chord(chordName: 'D', assetImagePath: 'assets/chords/D.png'),
  Chord(chordName: 'D7', assetImagePath: 'assets/chords/D7.png'),
  Chord(chordName: 'Dsus4', assetImagePath: 'assets/chords/Dsus4.png'),
  Chord(chordName: 'D+', assetImagePath: 'assets/chords/D+.png'),
  Chord(chordName: 'E', assetImagePath: 'assets/chords/E.png'),
  Chord(chordName: 'Em', assetImagePath: 'assets/chords/Em.png'),
  Chord(chordName: 'E7', assetImagePath: 'assets/chords/E7.png'),
  Chord(chordName: 'Esus2', assetImagePath: 'assets/chords/Esus2.png'),
  Chord(chordName: 'E+', assetImagePath: 'assets/chords/E+.png'),
  Chord(chordName: 'F', assetImagePath: 'assets/chords/F.png'),
  Chord(chordName: 'Fm', assetImagePath: 'assets/chords/Fm.png'),
  Chord(chordName: 'F7', assetImagePath: 'assets/chords/F7.png'),
  Chord(chordName: 'G', assetImagePath: 'assets/chords/G.png'),
  Chord(chordName: 'Gm', assetImagePath: 'assets/chords/Gm.png'),
  Chord(chordName: 'G7', assetImagePath: 'assets/chords/G7.png'),
  Chord(chordName: 'Gadd9', assetImagePath: 'assets/chords/Gadd9.png'),
  Chord(chordName: 'Bm9', assetImagePath: 'assets/chords/Bm9.png'),
  Chord(chordName: 'B7', assetImagePath: 'assets/chords/B7.png'),
  Chord(chordName: 'Bbm', assetImagePath: 'assets/chords/Bbm.png'),
  Chord(chordName: 'Bb', assetImagePath: 'assets/chords/Bb.png'),
  Chord(chordName: 'Bb7', assetImagePath: 'assets/chords/Bb7.png'),
  Chord(chordName: 'Bb+', assetImagePath: 'assets/chords/Bb+.png'),
  Chord(chordName: 'Bbsus4', assetImagePath: 'assets/chords/Bbsus4.png'),
  Chord(chordName: 'Bbsus2', assetImagePath: 'assets/chords/Bbsus2.png'),
];
Map<String, String> chordImageMap = {
  for (final chord in allChords) chord.chordName: chord.assetImagePath,
};

List<String> allChordNames = allChords.map((chord) => chord.chordName).toList();
