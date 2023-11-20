import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/common/provider/providers.dart';
import 'package:webapp/common/route/location/about_me/about_me.dart';
import 'package:webapp/common/route/location/contact_me/contact_me.dart';
import 'package:webapp/common/route/location/daily_journal/daily_journal.dart';
import 'package:webapp/common/route/location/dashboard/dashboard.dart';
import 'package:webapp/common/theme/themes.dart';

class PortfolioAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const PortfolioAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(menuProvider);
    final notifier = ref.read(menuProvider.notifier);

    return Stack(
      children: [
        AppBar(
          title: const Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  notifier.onMenuChanged(0);
                  Beamer.of(context).beamToNamed(DashboardLocation.route);
                },
                child: Center(
                  child: Text(
                    'DASHBOARD',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: state == 0 ? portfolioBlue : portfolioGreen,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  notifier.onMenuChanged(1);
                  Beamer.of(context).beamToNamed(DailyJournalLocation.route);
                },
                child: Center(
                  child: Text(
                    'MY NOTES',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: state == 1 ? portfolioBlue : portfolioGreen,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  notifier.onMenuChanged(2);
                  Beamer.of(context).beamToNamed(AboutMeLocaton.route);
                },
                child: Center(
                  child: Text(
                    'ABOUT ME',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: state == 2 ? portfolioBlue : portfolioGreen,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  notifier.onMenuChanged(3);
                  Beamer.of(context).beamToNamed(ContactMeLocation.route);
                },
                child: Center(
                  child: Text(
                    'CONTACT ME',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: state == 3 ? portfolioBlue : portfolioGreen,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 60,
          right: 60,
          bottom: 0,
          child: Container(
            height: 3,
            color: portfolioGreen,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
