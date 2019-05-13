import 'package:convex_bottom_navigation/convex_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  List<Widget> _children = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  Widget _buildBottomNavigationBar() {
    return ConvexBottomNavigation(
      activeIconColor: Colors.black,
      inactiveIconColor: Colors.grey,
      textColor: Colors.black,
      bigIconPadding: 15.0,
      smallIconPadding: 10.0,
      circleColor: Colors.white,
      tabs: [
        TabData(
          icon: const Icon(Icons.home),
          title: "RED",
        ),
        TabData(
          icon: const Icon(Icons.menu),
          title: "GREEN",
        ),
        TabData(
          icon: const Icon(Icons.settings),
          title: "BLUE",
        ),
      ],
      onTabChangedListener: (position) {
        setState(() {
          _currentIndex = position;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}
