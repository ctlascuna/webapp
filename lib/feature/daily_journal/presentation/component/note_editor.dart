import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/common/component/components.dart';
import 'package:webapp/common/theme/themes.dart';
import 'package:webapp/feature/daily_journal/presentation/view_model/providers.dart';

class NoteEditor extends HookConsumerWidget {
  const NoteEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(noteProvider);

    QuillController controller = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );

    final key = ValueKey<String>(controller.document.hashCode.toString());

    useEffect(
      () {
        if (state.note != null) {
          final opsList = jsonDecode(state.note ?? '') as List<dynamic>;
          final delta = Delta.fromJson(opsList);

          controller.document = Document.fromDelta(delta);
        }

        return;
      },
      [state],
    );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: portfolioWarm,
            borderRadius: BorderRadius.circular(20),
          ),
          child: QuillProvider(
            configurations: QuillConfigurations(
              controller: controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('en'),
              ),
            ),
            child: Column(
              children: [
                QuillToolbar(
                  key: key,
                  configurations: const QuillToolbarConfigurations(
                    showFontFamily: false,
                    showFontSize: false,
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: QuillEditor.basic(
                    configurations: const QuillEditorConfigurations(
                      readOnly: false,
                      placeholder: 'Talk to me...',
                    ),
                  ),
                ),
                PortfolioButton(
                  text: 'SAVE',
                  onPressed: () async {
                    final delta = controller.document.toDelta();
                    final jsonString = jsonEncode(delta.toJson());

                    ref.read(noteProvider.notifier).onNoteChanged(jsonString);
                    await ref.read(dailyJournalProvider.notifier).updateNote();
                    await ref.read(dailyJournalProvider.notifier).getMyNotes();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
