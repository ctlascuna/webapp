import 'package:beamer/beamer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/translations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/common/route/location/daily_journal/daily_journal.dart';
import 'package:webapp/common/route/location/dashboard/dashboard.dart';
import 'package:webapp/common/route/location/login/login.dart';
import 'package:webapp/common/route/location/main_location_builder.dart';
import 'package:webapp/common/service/local_storage_service.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = FirebaseAnalytics.instance;
    final observer = FirebaseAnalyticsObserver(
      analytics: analytics,
      routeFilter: (route) {
        if (route?.settings.name == null ||
            (route?.settings.name?.isEmpty ?? false)) {
          return false;
        }

        return defaultRouteFilter(route);
      },
    );

    analytics.logEvent(
        name: 'page_view', parameters: {'page_name': '/your-page-path'});
    final routerDelegate = useMemoized(() {
      return BeamerDelegate(
        initialPath: LoginLocation.route,
        locationBuilder: mainLocationBuilder,
        transitionDelegate: const NoAnimationTransitionDelegate(),
        beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
        navigatorObservers: [
          observer,
        ],
        guards: [
          BeamGuard(
            pathPatterns: [
              DashboardLocation.route,
              DailyJournalLocation.route,
            ],
            check: (context, _) {
              final container = ProviderScope.containerOf(context);
              final isAuthenticated =
                  container.read(localStorageService.notifier).getLoginStatus();
              return isAuthenticated ?? false;
            },
            beamToNamed: (_, __) => LoginLocation.route,
          ),
          BeamGuard(
            pathPatterns: [
              LoginLocation.route,
            ],
            check: (context, _) {
              final container = ProviderScope.containerOf(context);
              final isAuthenticated =
                  container.read(localStorageService.notifier).getLoginStatus();
              return !(isAuthenticated ?? true);
            },
            beamToNamed: (_, __) => DashboardLocation.route,
          ),
        ],
      );
    });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      localizationsDelegates: const [
        FlutterQuillLocalizations.delegate,
      ],
      theme: ThemeData(
        textTheme: GoogleFonts.sanchezTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
