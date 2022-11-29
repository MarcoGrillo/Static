import 'package:flutter/material.dart';
import 'package:static_app/screens/subfolders.dart';

class FolderCard extends StatelessWidget {
  Color folderColor = Colors.black;
  BoxConstraints boxConstraints;
  String folderTitle = '';

  FolderCard(this.folderColor, this.folderTitle, this.boxConstraints,
      {super.key});

  void _openFolder(context) {
    Navigator.of(context).pushNamed(SubfolderListScreen.routeName, arguments: {
      'appBarTitle': folderTitle,
      'constraints': boxConstraints,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openFolder(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
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
        width: 144.0,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.folder,
                color: folderColor,
              ),
              Text(
                folderTitle,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
