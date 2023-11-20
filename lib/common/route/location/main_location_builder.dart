import 'package:beamer/beamer.dart';
import 'package:webapp/common/route/location/about_me/about_me.dart';
import 'package:webapp/common/route/location/contact_me/contact_me.dart';
import 'package:webapp/common/route/location/daily_journal/daily_journal_location.dart';

import 'package:webapp/common/route/location/dashboard/dashboard.dart';
import 'package:webapp/common/route/location/login/login.dart';

final mainLocationBuilder = BeamerLocationBuilder(
  beamLocations: [
    LoginLocation(),
    DashboardLocation(),
    DailyJournalLocation(),
    ContactMeLocation(),
    AboutMeLocaton(),
  ],
);
