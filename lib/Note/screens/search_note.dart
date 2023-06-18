import 'package:first/Note/screens/note_view.dart';
import 'package:first/Note/store/note_home_state/note_home_state.dart';
import 'package:first/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../screen_photo/photo.dart';
import 'widgets/get_note_color.dart';

class SearchNote extends StatefulWidget {
  const SearchNote({
    Key? key,
    required this.noteHomeState,
  }) : super(key: key);

  final NoteHomeState noteHomeState;

  @override
  State<SearchNote> createState() => _SearchNoteState();
}

class _SearchNoteState extends State<SearchNote> {
  final searchFind = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: const Color(0xFF252525),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            border: Border.all(
              color: Colors.white10,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchFind,
                          textDirection: TextDirection.ltr,
                          autofocus: true,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          onChanged: widget.noteHomeState.searchNote,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 35),
                            hintText: '  Search by the keyword...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          searchFind.clear();
                          widget.noteHomeState.searchedNotes = <NoteModel>[].asObservable();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Observer(
          builder: (context) {
            if (widget.noteHomeState.searchedNotes.isEmpty) {
              return const SearchPhoto();
            }
            return ListView.builder(
              itemCount: widget.noteHomeState.searchedNotes.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NoteView(
                          noteHomeState: widget.noteHomeState,
                          note: widget.noteHomeState.searchedNotes[index],
                          index: index,
                        ),
                      ),
                    );
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
                                    widget.noteHomeState.searchedNotes[index].title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.noteHomeState.searchedNotes[index].body,
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
                );
              },
            );
          }
        ),
      ),
    );
  }
}
