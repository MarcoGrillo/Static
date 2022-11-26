import 'package:flutter/material.dart';
import 'package:static_app/models/folder.dart';

class FolderList extends StatelessWidget {
  FolderList({super.key});

  final List<Folder> folders = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: folders.isEmpty
          ? LayoutBuilder(
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
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return const Text('');
              },
              itemCount: 3,
            ),
    );
  }
}
