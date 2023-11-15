import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:webapp/feature/dashboard/presentation/screen/screens.dart';

class DashboardLocation extends BeamLocation<BeamState> {
  static const key = 'dashboard_location';
  static const name = 'Dashboard';
  static const title = 'Dashboard';
  static const route = '/dashboard';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey(key),
        name: name,
        title: title,
        child: DashboardScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [route];
}
