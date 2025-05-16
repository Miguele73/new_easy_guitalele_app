import '../../song/song.dart';

class ChordSong extends Song {
  final List<Section> sections;

  ChordSong({
    required super.title,
    required super.coverUrl,

    required super.difficulty,
    super.artist,
    required this.sections,
    required super.lengthOfSong,
  });
}

enum SectionType { verse, chorus, bridge, intro, outro, custom }

class Section {
  final SectionType type;
  final String? name;
  final List<Line> lines;

  Section({required this.type, this.name, required this.lines});
}

class Line {
  final List<ChordPosition> chords;
  final String text;

  Line({required this.chords, required this.text});
}

class ChordPosition {
  final String chordName;
  final int position;

  ChordPosition({required this.chordName, required this.position});
}
