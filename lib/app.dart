import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/common/route/location/login/login.dart';
import 'package:webapp/common/route/location/main_location_builder.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerDelegate = useMemoized(() {
      return BeamerDelegate(
        initialPath: LoginLocation.route,
        locationBuilder: mainLocationBuilder,
        transitionDelegate: const NoAnimationTransitionDelegate(),
        beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
      );
    });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      theme: ThemeData(
        textTheme: GoogleFonts.sanchezTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
