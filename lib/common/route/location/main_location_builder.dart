import 'package:beamer/beamer.dart';

import 'package:webapp/common/route/location/dashboard/dashboard.dart';
import 'package:webapp/common/route/location/login/login.dart';

final mainLocationBuilder = BeamerLocationBuilder(
  beamLocations: [
    LoginLocation(),
    DashboardLocation(),
  ],
);
