import 'package:webapp/feature/daily_journal/data/data_source/remote_sources.dart';
import 'package:webapp/feature/daily_journal/domain/entity/entities.dart';
import 'package:webapp/feature/daily_journal/domain/repository/repositories.dart';

class DailyJournalRepositoryImpl implements DailyJournalRepository {
  const DailyJournalRepositoryImpl({
    required DailyJournalRemoteSource remoteSource,
  }) : _remoteSource = remoteSource;

  final DailyJournalRemoteSource _remoteSource;

  @override
  Future<NoteEntity?> addNote({required NoteEntity note}) async {
    return _remoteSource.addNote(note: note);
  }

  @override
  Future<List<NoteEntity>?> getMyNotes() async {
    return _remoteSource.getMyNotes();
  }

  @override
  Future<void> deleteNote({required String noteId}) async {
    _remoteSource.deleteNote(noteId: noteId);
  }
}
