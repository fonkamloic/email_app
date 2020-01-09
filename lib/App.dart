import 'package:email_app/screens/InboxScreen.dart';
import 'package:email_app/screens/calenderScreen.dart';
import 'package:email_app/screens/contactScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class App extends StatefulWidget {
  final String title;

  App({this.title});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        body: [
          InboxScreen(),
          ContactScreen(),
          CalenderScreen(),
        ].elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text("Inbox"),
              icon: Icon(FontAwesomeIcons.inbox),
            ),
            BottomNavigationBarItem(
              title: Text("Contacts"),
              icon: Icon(Icons.people),
            ),
            BottomNavigationBarItem(
              title: Text("Calender"),
              icon: Icon(FontAwesomeIcons.calendar),
            ),
          ],
          onTap: _onItemTab,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }

  void _onItemTab(index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
