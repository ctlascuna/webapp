import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/common/component/components.dart';
import 'package:webapp/common/provider/menu_provider.dart';
import 'package:webapp/feature/daily_journal/presentation/component/components.dart';
import 'package:webapp/feature/daily_journal/presentation/component/my_notes.dart';
import 'package:webapp/feature/daily_journal/presentation/view_model/providers.dart';

class DailyJournalScreen extends HookConsumerWidget {
  const DailyJournalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dailyJournalProvider);
    final notifier = ref.read(dailyJournalProvider.notifier);

    final isFetchingData = useState(true);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref
          .read(menuProvider.notifier)
          .onRefresh(Beamer.of(context).currentBeamLocation);

      if (isFetchingData.value) {
        await notifier.getMyNotes();
        isFetchingData.value = false;
      }
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PortfolioAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(noteProvider.notifier).reset();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.note_add_sharp),
      ),
      body: Stack(
        children: [
          const PortfolioBackgroundContainer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 50),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isSmallScreen = constraints.maxWidth < 600;

                return isSmallScreen
                    ? Column(
                        children: [
                          const NoteEditor(),
                          if (state.isNotEmpty) const MyNotes(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const NoteEditor(),
                          if (state.isNotEmpty) const MyNotes(),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
