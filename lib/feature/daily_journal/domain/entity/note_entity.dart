import 'package:flutter/material.dart';

@immutable
class NoteEntity {
  const NoteEntity({
    required this.noteId,
    required this.note,
  });

  const NoteEntity.inital()
      : noteId = null,
        note = null;

  final String? noteId;
  final String? note;

  NoteEntity copyWith({
    String? noteId,
    String? note,
  }) {
    return NoteEntity(
      noteId: noteId ?? this.noteId,
      note: note ?? this.note,
    );
  }

  factory NoteEntity.fromJson(Map<String, dynamic> json) {
    return NoteEntity(
      noteId: json['noteId'] as String?,
      note: json['note'] as String?,
    );
  }
}
