import 'package:webapp/feature/daily_journal/domain/entity/entities.dart';

abstract class DailyJournalRemoteSource {
  Future<NoteEntity?> addNote({
    required NoteEntity note,
  });
  Future<List<NoteEntity>?> getMyNotes();
  Future<void> deleteNote({required String noteId});
  Future<void> generateMyNotes();
}
