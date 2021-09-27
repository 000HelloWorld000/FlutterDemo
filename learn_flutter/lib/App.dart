
import 'package:flutter/material.dart';
import 'package:learn_flutter/AppDrawer.dart';
import 'package:learn_flutter/CalendarScreen.dart';
import 'package:learn_flutter/ContactScreen.dart';
import 'package:learn_flutter/InboxScreen.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: [InboxScreen(), ContactScreen(), CalendarScreen()]
          .elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text("Inbox"), icon: Icon(Icons.mail)),
          BottomNavigationBarItem(
              title: Text("Contacts"), icon: Icon(Icons.people)),
          BottomNavigationBarItem(
              title: Text("Calendar"), icon: Icon(Icons.calendar_today)),
        ],
        onTap: _onBarItemTab,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onBarItemTab(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
