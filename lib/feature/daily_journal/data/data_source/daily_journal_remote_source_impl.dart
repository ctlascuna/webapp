import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:webapp/feature/daily_journal/data/data_source/remote_sources.dart';
import 'package:webapp/feature/daily_journal/domain/entity/note_entity.dart';

class DailyJournalRemoteSourceImpl implements DailyJournalRemoteSource {
  const DailyJournalRemoteSourceImpl({
    required GraphQLClient client,
  }) : _client = client;

  final GraphQLClient _client;

  @override
  Future<NoteEntity?> addNote({required NoteEntity note}) async {
    try {
      const addNoteMutation = r'''
        mutation addNote (
          $note: String,
          $noteId: String,
        ) {
          addNote(
            note: $note,
            noteId: $noteId,
          ) {
            noteId
            note
          }
        }
      ''';

      final options = MutationOptions(
        document: gql(addNoteMutation),
        variables: <String, dynamic>{
          'note': note.note.toString(),
          'noteId': note.noteId,
        },
      );

      final response = await _client.mutate(options);

      if (response.hasException) {
        return null;
      }

      final data = response.data?['addNote'] as Map<String, dynamic>;

      return NoteEntity?.fromJson(data);
    } on GraphQLError catch (_) {
      return null;
    }
  }

  @override
  Future<List<NoteEntity>?> getMyNotes() async {
    try {
      const getNotesQuery = r'''
        query getNotes () {
          getNotes {
            noteId
            note
          }
        }
      ''';

      final options = QueryOptions(
        document: gql(getNotesQuery),
      );

      final response = await _client.query(options);

      if (response.hasException) {
        return null;
      }

      final data = (response.data?['getNotes'] as List<dynamic>)
          .cast<Map<String, dynamic>>();

      final notes =
          List<NoteEntity>.from(data.map<NoteEntity>(NoteEntity.fromJson));

      return notes;
    } on GraphQLError catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteNote({required String noteId}) async {
    try {
      const addNoteMutation = r'''
        mutation deleteNote (
          $noteId: String,
        ) {
          deleteNote(
            noteId: $noteId,
          ) 
        }
      ''';

      final options = MutationOptions(
        document: gql(addNoteMutation),
        variables: <String, dynamic>{
          'noteId': noteId,
        },
      );

      await _client.mutate(options);
    } on GraphQLError catch (_) {}
  }
}
