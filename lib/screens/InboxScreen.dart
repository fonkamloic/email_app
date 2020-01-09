import 'package:email_app/AppDrawer.dart';
import 'package:email_app/messagelist.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
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
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "Important",
            ),
            Tab(
              text: "Other",
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: TabBarView(
        children: <Widget>[
          MessageList(status: "important"),
          MessageList(status: "other"),
        ],
      ),

    );
  }
}
