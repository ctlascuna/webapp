import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webapp/common/component/components.dart';
import 'package:webapp/common/provider/menu_provider.dart';
import 'package:webapp/feature/contact_me/presentation/component/components.dart';

class ContactMeScreen extends HookConsumerWidget {
  const ContactMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(menuProvider.notifier)
          .onRefresh(Beamer.of(context).currentBeamLocation);
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PortfolioAppBar(),
      body: Stack(
        children: [
          const PortfolioBackgroundContainer(),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(100),
                child: Wrap(
                  children: [
                    ContactMeCard(
                        imagePath: 'assets/logo/mail_logo.png',
                        link: 'ctlascuna@gmail.com',
                        onPressed: () async {
                          await Clipboard.setData(
                              const ClipboardData(text: 'ctlascuna@gmail.com'));
                          Fluttertoast.showToast(
                            msg: 'Email copied to clipboard',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return true;
                        }),
                    ContactMeCard(
                      imagePath: 'assets/logo/linkedin_logo.png',
                      link: 'in/ctlascuna18',
                      onPressed: () => launchUrl(
                        Uri.parse('https://www.linkedin.com/in/ctlascuna18/'),
                      ),
                    ),
                    ContactMeCard(
                      imagePath: 'assets/logo/git_logo.png',
                      link: 'ctlascuna',
                      onPressed: () => launchUrl(
                        Uri.parse('https://github.com/ctlascuna'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
