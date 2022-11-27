import 'package:flutter/material.dart';
import 'package:static_app/models/folder.dart';
import 'package:static_app/widgets/statistic_row.dart';

class Statistics extends StatelessWidget {
  List<Folder> folders = [];
  Statistics(this.folders, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.black12.withAlpha(10),
            Colors.black12,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      width: double.infinity,
      height: 325,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return LayoutBuilder(builder: (context, constraints) {
              return StatisticRow(
                  folders[index].color.withOpacity(0.7), constraints);
            });
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 30,
            );
          },
          itemCount: folders.length,
        ),
      ),
    );
  }
}
