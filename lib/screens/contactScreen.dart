import 'package:email_app/AppDrawer.dart';
import 'package:email_app/contactCounter.dart';
import 'package:email_app/contactListBuilder.dart';
import 'package:email_app/contact_search.dart';
import 'package:email_app/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:sprinkle/WebResourceManager.dart';


class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WebResourceManager<Contact> manager =
        context.fetch<WebResourceManager<Contact>>();
    manager.inFilter.add('');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            ContactCounter(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ContactSearch());
              },
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: ContactListBuilder(
          stream: manager.collection$,
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
