import 'package:flutter/material.dart';

class ContactMeCard extends StatelessWidget {
  final String imagePath;
  final String link;
  final Future<bool> Function() onPressed;

  const ContactMeCard({
    super.key,
    required this.imagePath,
    required this.link,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await onPressed();
      },
      child: Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 200,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  width: 120.0,
                  height: 120.0,
                ),
                const SizedBox(height: 10.0),
                Text(
                  link,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
