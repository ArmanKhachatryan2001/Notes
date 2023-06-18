import 'package:first/Note/screens/create_note.dart';
import 'package:first/Note/screens/search_note.dart';
import 'package:first/Note/screens/widgets/note_card.dart';
import 'package:first/Note/store/note_home_state/note_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../screen_photo/photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NoteHomeState _noteHomeState = NoteHomeState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchNote(
                    noteHomeState: _noteHomeState,
                  ),
                ),
              );
            },
            icon: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      ////////////////
      body: Observer(builder: (context) {
        return Visibility(
          visible: _noteHomeState.notes.isEmpty,
          replacement: ListView.builder(
            itemCount: _noteHomeState.notes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                index: index,
                noteHomeState: _noteHomeState,
              );
            },
          ),
          child: const HomePhoto(),
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateNote(
                noteHomeState: _noteHomeState,
              ),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(color: Colors.white, Icons.add),
      ),
    );
  }
}
