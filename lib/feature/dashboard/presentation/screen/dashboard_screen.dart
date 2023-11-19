import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/common/component/components.dart';
import 'package:webapp/common/theme/themes.dart';
import 'package:webapp/feature/daily_journal/presentation/view_model/daily_journal_provider.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PortfolioAppBar(),
      body: Stack(
        children: [
          const PortfolioBackgroundContainer(),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 50,
              top: 100,
              left: 50,
              right: 50,
            ),
            child: Container(
              width: 400,
              height: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: portfolioBeige,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/logo/cloud_logo.png',
                        ),
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          'Do you want a PDF copy of your notes? '
                          'Just click the download button below to save a '
                          'local copy of your notes to your Downloads folder.',
                          style: TextStyle(
                            color: portfolioGreen,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  PortfolioButton(
                    text: 'DOWNLOAD MY NOTES',
                    onPressed: () {
                      ref.read(dailyJournalProvider.notifier).generateMyNotes();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
