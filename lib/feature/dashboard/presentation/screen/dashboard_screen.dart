import 'package:flutter/material.dart';

import 'package:webapp/common/component/components.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PortfolioAppBar(),
      body: Stack(
        children: [
          PortfolioBackgroundContainer(),
        ],
      ),
    );
  }
}
