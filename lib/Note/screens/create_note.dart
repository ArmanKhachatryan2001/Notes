import 'dart:developer';

import 'package:first/Note/store/note_home_state/note_home_state.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({
    Key? key,
    required this.noteHomeState,
  }) : super(key: key);

  final NoteHomeState noteHomeState;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  bool get noteCreated =>
      titleController.text.isNotEmpty && bodyController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // alignment: Alignment.topCenter,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15),
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
              onPressed: () {},
              icon: Container(
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(6),
                child: const Icon(
                  Icons.remove_red_eye_outlined,
                  size: 20,
                ),
              )),
          IconButton(
            onPressed: () async {
              final note = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Icon(
                    Icons.info,
                    color: Colors.white12,
                    size: 20,
                  ),
                  content: const SizedBox(
                    child: Text(
                      'Save changes ?',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (noteCreated) {
                                  Navigator.pop(
                                    context,
                                    NoteModel(
                                      id: const Uuid().v4(),
                                      title: titleController.text,
                                      body: bodyController.text,
                                    ),
                                  );
                                } else {
                                  print("error");
                                }
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Discard',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
              log(note.toString());
              if (note is NoteModel) {
                widget.noteHomeState.addNote(note);
                Navigator.pop(context);
              }
            },
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.save,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(fontSize: 28),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
            ),
            TextFormField(
              controller: bodyController,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Type something...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
