import 'package:flutter/material.dart';

class PortfolioBackgroundContainer extends StatelessWidget {
  const PortfolioBackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.png'),
        ),
      ),
    );
  }
}
