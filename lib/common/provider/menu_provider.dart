import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/common/route/location/about_me/about_me.dart';
import 'package:webapp/common/route/location/contact_me/contact_me.dart';
import 'package:webapp/common/route/location/daily_journal/daily_journal.dart';
import 'package:webapp/common/route/location/dashboard/dashboard.dart';

class MenuNotifier extends StateNotifier<int> {
  MenuNotifier() : super(0);

  void onMenuChanged(int menu) => state = menu;
  void onRefresh(BeamLocation path) {
    if (path is DashboardLocation) state = 0;
    if (path is DailyJournalLocation) state = 1;
    if (path is AboutMeLocaton) state = 2;
    if (path is ContactMeLocation) state = 3;
  }
}

final menuProvider = StateNotifierProvider<MenuNotifier, int>((ref) {
  return MenuNotifier();
});
