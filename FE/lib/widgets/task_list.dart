import 'package:flutter/material.dart';
import 'package:static_app/models/subfolder.dart';

class TaskList extends StatefulWidget {
  late BoxConstraints boxConstraints;
  late List<Subfolder> subfoldersList;
  late int folderId;

  TaskList(this.boxConstraints, this.subfoldersList, this.folderId,
      {super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 60,
      ),
      height: widget.boxConstraints.maxHeight * 0.8,
      //height: 500,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          print(widget.folderId);
          // print(widget.subfoldersList
          //     .where((element) => element.folderId == widget.folderId));
          return Text(
            '',
            // widget.subfoldersList[widget.folderId].tasks[index].title,
            style: Theme.of(context).textTheme.headline6,
          );
        },
        itemCount: widget.subfoldersList.length,
      ),
    );
  }
}
