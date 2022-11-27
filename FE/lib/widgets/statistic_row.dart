import 'package:flutter/material.dart';
import 'package:static_app/widgets/progress_bar.dart';

class StatisticRow extends StatelessWidget {
  Color folderColor = Colors.black;
  BoxConstraints constraints = BoxConstraints();

  StatisticRow(this.folderColor, this.constraints, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.folder,
          color: folderColor,
        ),
        ProgressBar(constraints.maxWidth),
      ],
    );
  }
}
