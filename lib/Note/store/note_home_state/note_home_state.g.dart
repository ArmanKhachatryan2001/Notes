// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteHomeState on _NoteHomeState, Store {
  late final _$notesAtom = Atom(name: '_NoteHomeState.notes', context: context);

  @override
  ObservableList<NoteModel> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<NoteModel> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$searchedNotesAtom =
      Atom(name: '_NoteHomeState.searchedNotes', context: context);

  @override
  ObservableList<NoteModel> get searchedNotes {
    _$searchedNotesAtom.reportRead();
    return super.searchedNotes;
  }

  @override
  set searchedNotes(ObservableList<NoteModel> value) {
    _$searchedNotesAtom.reportWrite(value, super.searchedNotes, () {
      super.searchedNotes = value;
    });
  }

  late final _$_NoteHomeStateActionController =
      ActionController(name: '_NoteHomeState', context: context);

  @override
  void addNote(NoteModel note) {
    final _$actionInfo = _$_NoteHomeStateActionController.startAction(
        name: '_NoteHomeState.addNote');
    try {
      return super.addNote(note);
    } finally {
      _$_NoteHomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNote(NoteModel note) {
    final _$actionInfo = _$_NoteHomeStateActionController.startAction(
        name: '_NoteHomeState.removeNote');
    try {
      return super.removeNote(note);
    } finally {
      _$_NoteHomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchNote(String title) {
    final _$actionInfo = _$_NoteHomeStateActionController.startAction(
        name: '_NoteHomeState.searchNote');
    try {
      return super.searchNote(title);
    } finally {
      _$_NoteHomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNote(NoteModel note) {
    final _$actionInfo = _$_NoteHomeStateActionController.startAction(
        name: '_NoteHomeState.updateNote');
    try {
      return super.updateNote(note);
    } finally {
      _$_NoteHomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
searchedNotes: ${searchedNotes}
    ''';
  }
}
