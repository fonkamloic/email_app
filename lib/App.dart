import 'package:email_app/AppDrawer.dart';
import 'package:email_app/messagelist.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final String title;

  App({this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
//              setState(() {
//                future =  Message.browse();
//              });
              },
            )
          ],
          bottom: TabBar(tabs: <Widget>[
            Tab(text: "Important",),
            Tab(text: "Other",),
          ],),
        ),
        drawer: AppDrawer(),
        body: TabBarView(children: <Widget>[
          MessageList(status: "important"),
          MessageList(status: "other"),

        ],),
      ),
    );
  }
}
