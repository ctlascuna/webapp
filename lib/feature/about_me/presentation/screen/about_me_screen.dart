import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webapp/common/component/components.dart';
import 'package:webapp/common/provider/providers.dart';
import 'package:webapp/common/theme/themes.dart';

class AboutMeScreen extends HookConsumerWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(100),
              child: Wrap(
                spacing: 100,
                children: [
                  Container(
                    width: 300.0,
                    height: 450.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/dp.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(200, 300)),
                      border: Border.all(
                        color: portfolioBeige,
                        width: 4.0,
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: portfolioBeige,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/logo/cloud_logo.png',
                              ),
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                'Do you want a PDF copy of my updated resume? '
                                'Just click the download button below to save a '
                                'local copy of my resume to your Downloads folder.',
                                style: TextStyle(
                                  color: portfolioGreen,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        PortfolioButton(
                          text: 'VIEW MY RESUME',
                          onPressed: () async {
                            launchUrl(Uri.parse(
                                'https://github.com/ctlascuna/my_resume/blob/main/lascuna_resume.pdf'));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
