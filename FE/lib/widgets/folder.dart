import 'package:flutter/material.dart';

class Folder extends StatelessWidget {
  const Folder({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(5),
        child: Stack(
          children: [
            const Text(''),
          ],
        ),
      ),
    );
  }
}
