import 'package:first/Note/store/note_home_state/note_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../models/note_model.dart';
import 'update_note_screen.dart';

class NoteView extends StatefulWidget {
  const NoteView({
    Key? key,
    required this.note,
    required this.noteHomeState,
    required this.index,
  }) : super(key: key);

  final NoteModel note;
  final NoteHomeState noteHomeState;
  final int index;

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.only(left: 8),
            child: const Align(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UpdateNoteScreen(
                    note: widget.note,
                    noteHomeState: widget.noteHomeState,
                  ),
                ),
              );
            },
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.edit,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Observer(
          builder: (context) {
            return Column(
              children: [
                Text(
                  widget.noteHomeState.notes[widget.index].title,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.noteHomeState.notes[widget.index].body,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
