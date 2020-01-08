import 'package:email_app/AppDrawer.dart';
import 'package:email_app/contactListBuilder.dart';
import 'package:email_app/contactManager.dart';
import 'package:email_app/contact_search_delegate.dart';
import 'package:email_app/model/contact.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            Chip(
              label: StreamBuilder<int>(
                  stream: manager.contactCounter,
                  builder: (context, snapshot) {
                    return Text(
                      (snapshot.data ?? 0).toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  }),
              backgroundColor: Colors.red,
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: ContactSearchDelegate(manager: manager));
              },
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: ContactListBuilder(
          stream: manager.contactListNow,
          builder: (context, contact) => ListView.separated(
            itemCount: contact.length,
            itemBuilder: (BuildContext context, int index) {
              Contact _contact = contact[index];
              return ListTile(
                leading: CircleAvatar(),
                title: Text(_contact.name),
                subtitle: Text(_contact.email),
              );
            },
            separatorBuilder: (context, index) => Divider(),
          ),
        ),
      ),
    );
  }
}
