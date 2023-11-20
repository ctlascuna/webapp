import 'package:flutter_test/flutter_test.dart';

import 'package:webapp/feature/daily_journal/domain/entity/entities.dart';

void main() {
  group('NoteEntity', () {
    test('should create an instance of NoteEntity', () {
      const noteEntity = NoteEntity(
        noteId: '1',
        note: 'This is a test note.',
      );

      expect(noteEntity, isA<NoteEntity>());
    });

    test('should create an instance of NoteEntity.inital', () {
      const noteEntity = NoteEntity.inital();

      expect(noteEntity, isA<NoteEntity>());
      expect(noteEntity.noteId, null);
      expect(noteEntity.note, null);
    });

    test('should create a copy of NoteEntity with updated values', () {
      const originalEntity = NoteEntity(
        noteId: '1',
        note: 'This is a test note.',
      );

      final updatedEntity = originalEntity.copyWith(note: 'Updated note');

      expect(updatedEntity, isNot(same(originalEntity)));
      expect(updatedEntity.noteId, '1');
      expect(updatedEntity.note, 'Updated note');
    });

    test('should create NoteEntity from JSON', () {
      final json = {'noteId': '1', 'note': 'This is a test note.'};

      final noteEntity = NoteEntity.fromJson(json);

      expect(noteEntity, isA<NoteEntity>());
      expect(noteEntity.noteId, '1');
      expect(noteEntity.note, 'This is a test note.');
    });
  });
}
