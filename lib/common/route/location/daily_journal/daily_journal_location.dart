import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:webapp/feature/daily_journal/presentation/screen/screens.dart';

class DailyJournalLocation extends BeamLocation<BeamState> {
  static const key = 'daily_journal_location';
  static const name = 'Daily Journal';
  static const title = 'Daily Journal';
  static const route = '/daily-journal';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey(key),
        name: name,
        title: title,
        child: DailyJournalScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [route];
}
