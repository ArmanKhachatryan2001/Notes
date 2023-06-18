class NoteModel {
  final String id;
  final String title;
  final String body;

  NoteModel({
    required this.id,
    required this.title,
    required this.body,
  });

  NoteModel copyWith({
    String? id,
    String? title,
    String? body,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
