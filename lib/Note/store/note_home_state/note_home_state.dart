import 'package:mobx/mobx.dart';
import '../../../models/note_model.dart';
part 'note_home_state.g.dart';

class NoteHomeState = _NoteHomeState with _$NoteHomeState;

abstract class _NoteHomeState with Store {

  @observable
  ObservableList<NoteModel> notes = ObservableList<NoteModel>.of([]);

  @observable
  ObservableList<NoteModel> searchedNotes = ObservableList<NoteModel>.of([]);

  @action
  void addNote(NoteModel note) {
    notes.add(note);
  }

  @action
  void removeNote(NoteModel note) {
    notes.removeWhere((td) => td.id == note.id);
  }

  @action
  void searchNote(String title) {
    final int found = notes.indexWhere((element) => element.title.contains(title));
    if(found != -1){
      searchedNotes = <NoteModel>[].asObservable();
      searchedNotes.add(notes[found]);
    } else {
      searchedNotes = <NoteModel>[].asObservable();
    }
  }

  @action
  void updateNote(NoteModel note) {
    final index = notes.indexWhere((element) => note.id == element.id);

    if (index != -1) {
      notes[index] = note;
    }
  }
}
