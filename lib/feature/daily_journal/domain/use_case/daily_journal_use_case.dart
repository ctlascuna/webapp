import 'package:webapp/feature/daily_journal/domain/entity/entities.dart';
import 'package:webapp/feature/daily_journal/domain/repository/repositories.dart';

class DailyJournalUseCase {
  const DailyJournalUseCase({
    required DailyJournalRepository repository,
  }) : _repository = repository;

  final DailyJournalRepository _repository;

  Future<NoteEntity?> addNote({
    required NoteEntity note,
  }) async {
    return _repository.addNote(
      note: note,
    );
  }

  Future<List<NoteEntity>?> getMyNotes() async {
    return _repository.getMyNotes();
  }

  Future<void> deleteNote({required String noteId}) async {
    await _repository.deleteNote(noteId: noteId);
  }

  Future<void> generateMyNotes() async {
    await _repository.generateMyNotes();
  }
}
