import 'package:flutter/material.dart';
import 'package:static_app/models/folder.dart';
import 'package:static_app/widgets/folder_card.dart';
import 'package:static_app/widgets/statistics.dart';

class FolderList extends StatelessWidget {
  FolderList({super.key});

  final List<Folder> folders = [
    const Folder(
      id: '1',
      title: 'First',
      color: Colors.green,
    ),
    const Folder(
      id: '2',
      title: 'Second',
      color: Colors.red,
    ),
    const Folder(
      id: '3',
      title: 'Third',
      color: Colors.blue,
    ),
  ];

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

  Widget _buildFolderList(context) {
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
                return FolderCard(folders[index].color.withOpacity(0.7));
              },
              itemCount: folders.length,
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
          Statistics(folders),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          folders.isEmpty ? _buildEmptyListLayout() : _buildFolderList(context),
    );
  }
}
