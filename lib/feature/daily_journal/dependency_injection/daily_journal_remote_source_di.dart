import 'package:webapp/common/service/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/feature/daily_journal/data/data_source/remote_sources.dart';

final dailyJournalRemoteSourceDi = Provider(
  (ref) {
    final client = ref.watch(graphQLService);

    return DailyJournalRemoteSourceImpl(client: client);
  },
  dependencies: [graphQLService],
);
