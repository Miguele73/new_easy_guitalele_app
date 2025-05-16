import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/desicions_box.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';

class ScaleSelectionScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const ScaleSelectionScreen(this.myRepository, {super.key});
  @override
  State<ScaleSelectionScreen> createState() => _ScaleSelectionScreenState();
}

class _ScaleSelectionScreenState extends State<ScaleSelectionScreen> {
  get scales => [
    'C Major',
    'G Major',
    'D Major',
    'A Major',
    'E Major',
    'B Major',
    'F# Major',
    'Db Major',
    'Ab Major',
    'Eb Major',
  ];

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
                color: Color(0xFFbcbabe),
                selectionText: 'Scales',
                imageIcon: ImageIcon(AssetImage('assets/icons/ClefIcon.png')),
              ),
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: scales.length,
                itemBuilder: (context, index) {
                  final String scale = scales[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      color: const Color(0xFFBCBABE),
                      child: ListTile(
                        title: Text(scale),
                        leading: const Icon(Icons.music_note),
                        onTap: () {
                          // Handle scale selection
                        },
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
