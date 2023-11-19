import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/feature/daily_journal/dependency_injection/dependency_injections.dart';
import 'package:webapp/feature/daily_journal/domain/entity/entities.dart';
import 'package:webapp/feature/daily_journal/domain/use_case/use_cases.dart';
import 'package:webapp/feature/daily_journal/presentation/view_model/providers.dart';

class DailyJournalNotifier extends StateNotifier<List<NoteEntity>> {
  DailyJournalNotifier({required this.dailyJournalUseCase, required this.ref})
      : super(const []);

  final DailyJournalUseCase dailyJournalUseCase;
  final Ref ref;

  Future<bool> updateNote() async {
    final note = ref.read(noteProvider);
    final response = await dailyJournalUseCase.addNote(note: note);

    return response == null ? false : true;
  }

  Future<void> getMyNotes() async {
    final response = await dailyJournalUseCase.getMyNotes();

    if (response != null) {
      state = response;
    }
  }

  Future<void> deleteNote({required String noteId}) async {
    await dailyJournalUseCase.deleteNote(noteId: noteId);
  }
}

final dailyJournalProvider =
    StateNotifierProvider<DailyJournalNotifier, List<NoteEntity>>((ref) {
  final dailyJournalUseCase = ref.read(dailyJournalUseCaseDi);
  return DailyJournalNotifier(
    dailyJournalUseCase: dailyJournalUseCase,
    ref: ref,
  );
});
