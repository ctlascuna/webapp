import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:glass/glass.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/common/theme/color.dart';
import 'package:webapp/feature/daily_journal/presentation/view_model/daily_journal_provider.dart';
import 'package:webapp/feature/daily_journal/presentation/view_model/note_provider.dart';

class MyNotes extends HookConsumerWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dailyJournalProvider);
    final notifier = ref.read(dailyJournalProvider.notifier);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            final note = state.reversed.toList()[index];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    ref.read(noteProvider.notifier).onStateChanged(note);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    constraints: const BoxConstraints(
                      minHeight: 50,
                      maxHeight: 100,
                      minWidth: double.infinity,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            Document.fromJson(jsonDecode(note.note ?? ''))
                                .toPlainText(),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            await notifier.deleteNote(
                                noteId: note.noteId ?? '');
                            await notifier.getMyNotes();
                            if (note.noteId == ref.read(noteProvider).noteId) {
                              ref.read(noteProvider.notifier).reset();
                            }
                          },
                        ),
                      ],
                    ),
                  ).asGlass(
                    clipBorderRadius:
                        const BorderRadius.all(Radius.circular(12)),
                    tintColor: portfolioGreen,
                  ),
                ),
                const SizedBox(height: 25),
              ],
            );
          },
        ),
      ),
    );
  }
}
