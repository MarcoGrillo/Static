import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  double maxWidth = 0.0;
  double totalCompletion = 0.6;
  ProgressBar(this.maxWidth, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 5,
              left: 10,
            ),
            width: maxWidth * 0.4,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black12.withAlpha(10),
                width: 1,
              ),
              color: Colors.green.shade400,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 5,
              left: 10,
            ),
            width: maxWidth * 0.8,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black12.withAlpha(10),
                width: 1,
              ),
              color: Colors.black12.withAlpha(10),
            ),
          ),
        ],
      ),
    );
  }
}
