import 'package:covidtracker/screens/guide.dart';
import 'package:covidtracker/screens/total.dart';
import 'package:covidtracker/services/total_corona.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/screens/home.dart';


void main() => runApp(MaterialApp(
    home: new HomePage()
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List<Widget> _children = [
    //country(),
    totalCorona(),
    home(),
    guide(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        fixedColor: Colors.green[400],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.language),
            title: new Text('World'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.flag),
            title: new Text('Country'),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            title: new Text('Guide'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
    );
  }
}
