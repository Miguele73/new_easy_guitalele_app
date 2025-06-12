import 'package:flutter/material.dart';

class DesicionsBox extends StatefulWidget {
  final Color color;
  final String selectionText;
  final ImageIcon imageIcon;
  const DesicionsBox({
    super.key,
    required this.color,
    required this.selectionText,
    required this.imageIcon,
  });

  @override
  State<DesicionsBox> createState() => _DesicionsBoxState();
}

class _DesicionsBoxState extends State<DesicionsBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.selectionText == 'Songs') {
          Navigator.pushNamed(context, '/songListScreen');
        } else if (widget.selectionText == 'Chords') {
          Navigator.pushNamed(context, '/chordSelectionScreen');
        } else if (widget.selectionText == 'Scales') {
          Navigator.pushNamed(context, '/scaleSelectionScreen');
        } else if (widget.selectionText == 'Chordliste') {
          Navigator.pushNamed(context, '/chordListScreen');
        }
      },

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.color,
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(24),

        width: 300,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                if (widget.selectionText == 'Songs') {
                  Navigator.pushNamed(context, '/songListScreen');
                } else if (widget.selectionText == 'Chords') {
                  Navigator.pushNamed(context, '/chordSelectionScreen');
                } else if (widget.selectionText == 'Scales') {
                  Navigator.pushNamed(context, '/scaleSelectionScreen');
                } else if (widget.selectionText == 'Chordliste') {
                  Navigator.pushNamed(context, '/chordListScreen');
                } else if (widget.selectionText == 'Meine Favoriten') {
                  Navigator.pushNamed(context, '/favoritesScreen');
                }
              },
              icon: widget.imageIcon,
            ),
            const SizedBox(width: 8),
            Text(
              widget.selectionText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
