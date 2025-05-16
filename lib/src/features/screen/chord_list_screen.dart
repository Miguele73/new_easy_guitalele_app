import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
// ignore: library_prefixes
import 'package:new_easy_guitalele_app/src/features/auth/chord/chord.dart'
    // ignore: library_prefixes
    as ChordList;
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/desicions_box.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';

class ChordListScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const ChordListScreen(this.myRepository, {super.key});

  @override
  State<ChordListScreen> createState() => _ChordListScreenState();
}

class _ChordListScreenState extends State<ChordListScreen> {
  void _showChordDiagram(String chordName) {
    setState(() {});
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: _closeChordDiagram,
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (ChordList.chordImageMap.containsKey(chordName))
                    Image.asset(ChordList.chordImageMap[chordName]!),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      chordName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _closeChordDiagram() {
    setState(() {});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF505160),
      appBar: MyAppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DesicionsBox(
                color: Color(0xFFBFDCCF),
                selectionText: 'Chordliste',
                imageIcon: ImageIcon(AssetImage('assets/icons/ChordsIcon.png')),
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: ChordList.allChordNames.length,
                itemBuilder: (context, index) {
                  final chordName = ChordList.allChordNames[index];
                  return GestureDetector(
                    onTap: () => _showChordDiagram(chordName),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFBCBABE),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          chordName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
