import 'package:first/Note/screens/note_view.dart';
import 'package:first/Note/screens/widgets/get_note_color.dart';
import 'package:first/Note/store/note_home_state/note_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../models/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.index,
    required this.noteHomeState,
  }) : super(key: key);

  final int index;
  final NoteHomeState noteHomeState;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NoteView(
              noteHomeState: noteHomeState,
              note: noteHomeState.notes[index],
              index: index,
            ),
          ),
        );
      },
      child: Dismissible(
        key: ValueKey(noteHomeState.notes[index].id),
        background: Container(
          color: Colors.red,
          child: const Icon(Icons.delete),
        ),
        onDismissed: (_){
          noteHomeState.removeNote(noteHomeState.notes[index]);
        },
        child: Card(
          color: GetNoteColor.getNoteCardColor(index),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Observer(
              builder: (context) {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        noteHomeState.notes[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        noteHomeState.notes[index].body,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
