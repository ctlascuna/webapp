import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:webapp/feature/contact_me/presentation/screen/screens.dart';

class ContactMeLocation extends BeamLocation<BeamState> {
  static const key = 'contact_me_location';
  static const name = 'Contact Me';
  static const title = 'Contact Me';
  static const route = '/contact-me';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey(key),
        name: name,
        title: title,
        child: ContactMeScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [route];
}
