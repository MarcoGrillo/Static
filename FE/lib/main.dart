import 'package:flutter/material.dart';
import 'package:static_app/screens/create_item.dart';

import 'package:static_app/screens/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Static',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                color: Colors.black54,
              ),
              headline5: const TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
      ),
      home: const DashboardScreen(),
      routes: {
        CreateItemScreen.routeName: (context) => const CreateItemScreen()
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Static'),
      ),
      body: const Center(
        child: Text('Static'),
      ),
    );
  }
}
