import 'package:flutter/material.dart';
import 'package:static_app/screens/create_item.dart';
import 'package:static_app/widgets/folder_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const routeName = '/dashboard';

  void _addFolder(BuildContext context) {
    Navigator.of(context).pushNamed(CreateItemScreen.routeName, arguments: {
      'appBarTitle': 'Nuova Cartella',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: FolderList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addFolder(context),
        elevation: 4,
        child: const Icon(Icons.add),
      ),
    );
  }
}
