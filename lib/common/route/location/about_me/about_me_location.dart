import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:webapp/feature/about_me/presentation/screen/screens.dart';

class AboutMeLocaton extends BeamLocation<BeamState> {
  static const key = 'about_me_location';
  static const name = 'About Me';
  static const title = 'About Me';
  static const route = '/about-me';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey(key),
        name: name,
        title: title,
        child: AboutMeScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [route];
}
