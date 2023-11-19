import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/feature/daily_journal/data/repository/repositories.dart';
import 'package:webapp/feature/daily_journal/dependency_injection/dependency_injections.dart';

final dailyJournalRepositoryDi = Provider(
  (ref) {
    final remoteSource = ref.watch(dailyJournalRemoteSourceDi);

    return DailyJournalRepositoryImpl(remoteSource: remoteSource);
  },
  dependencies: [dailyJournalRemoteSourceDi],
);
