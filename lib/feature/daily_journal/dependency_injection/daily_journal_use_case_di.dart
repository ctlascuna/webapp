import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/feature/daily_journal/dependency_injection/dependency_injections.dart';
import 'package:webapp/feature/daily_journal/domain/use_case/use_cases.dart';

final dailyJournalUseCaseDi = Provider(
  (ref) {
    final repository = ref.watch(dailyJournalRepositoryDi);

    return DailyJournalUseCase(repository: repository);
  },
  dependencies: [dailyJournalRepositoryDi],
);
