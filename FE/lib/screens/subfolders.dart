import 'package:flutter/material.dart';
import 'package:static_app/models/subfolder.dart';

import 'package:static_app/mock/data.dart';
import 'package:static_app/widgets/subfolder_card.dart';

class SubfolderListScreen extends StatefulWidget {
  const SubfolderListScreen({super.key});

  static const routeName = '/folder';

  @override
  State<SubfolderListScreen> createState() => _SubfolderListScreenState();
}

class _SubfolderListScreenState extends State<SubfolderListScreen> {
  @override
  Widget build(BuildContext context) {
    List<Subfolder> subfoldersList = subfolders;

    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    final String? title = routeArgs['appBarTitle'].toString();
    final BoxConstraints boxConstraints =
        routeArgs['constraints'] as BoxConstraints;
    //final String? boxConstraints = routeArgs['constraints'];
    final appBar = AppBar(
      title: Text(title ?? 'Nuovo'),
      bottom: TabBar(
        isScrollable: true, // Required
        unselectedLabelColor: Colors.white30, // Other tabs color
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 30,
        ), // Space between tabs
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ), // Indicator height
          insets: EdgeInsets.symmetric(
            horizontal: 48,
          ), // Indicator width
        ),
        tabs: [
          for (var subfolder in subfoldersList)
            Tab(
              text: subfolder.title,
            )
        ],
      ),
    );

    Widget buildSubFolderList(itemCount) {
      // print(routeArgs['appBarTitle']);
      return Container(
        margin: const EdgeInsets.only(
          top: 60,
        ),
        height: boxConstraints.maxHeight * 0.8,
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
            // return subfolder_card
            return SubfolderCard(
              subfoldersList[index].colors,
              subfoldersList[index].title,
            );
          },
          itemCount: itemCount,
        ),
      );
    }

    return DefaultTabController(
      initialIndex: 0,
      length: subfoldersList.length,
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              // child: buildSubFolderList(subfoldersList.length),
              ),
        ),
      ),
    );
  }
}
