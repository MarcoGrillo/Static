import 'package:flutter/material.dart';
import 'package:static_app/models/folder.dart';
import 'package:static_app/widgets/folder_card.dart';
import 'package:static_app/widgets/statistics.dart';

import 'package:static_app/mock/data.dart';

class FolderList extends StatelessWidget {
  FolderList({super.key});

  List<Folder> foldersList = folders;

  Widget _buildEmptyListLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.2,
            ),
            Image.asset(
              'assets/images/inbox.png',
              fit: BoxFit.contain,
              height: constraints.maxHeight * 0.30,
              width: constraints.maxHeight * 0.30,
              color: Colors.white.withOpacity(0.9),
              colorBlendMode: BlendMode.modulate,
            ),
            Text(
              'Non ci sono cartelle',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        );
      },
    );
  }

  Widget _buildFolderListLayout(context) {
    return LayoutBuilder(builder: (context, constraints) {
      return _buildFolderList(context, constraints);
    });
  }

  Widget _buildFolderList(context, constraints) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              bottom: 10,
            ),
            child: Text(
              'Cartelle',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 205,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FolderCard(
                  foldersList[index].color.withOpacity(0.7),
                  foldersList[index].title,
                  constraints,
                );
              },
              itemCount: foldersList.length,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 10,
              bottom: 10,
            ),
            child: Text(
              'Statitische',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Statistics(foldersList),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: foldersList.isEmpty
          ? _buildEmptyListLayout()
          : _buildFolderListLayout(context),
    );
  }
}
