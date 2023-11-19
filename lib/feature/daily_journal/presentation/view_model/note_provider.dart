import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/feature/daily_journal/domain/entity/entities.dart';

class NoteNotifier extends StateNotifier<NoteEntity> {
  NoteNotifier() : super(const NoteEntity.inital());

  void onNoteChanged(String note) => state = state.copyWith(note: note);

  void onStateChanged(NoteEntity note) => state = note;

  void reset() => state = const NoteEntity.inital();
}

final noteProvider = StateNotifierProvider<NoteNotifier, NoteEntity>((ref) {
  return NoteNotifier();
});
