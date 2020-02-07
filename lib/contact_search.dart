import 'package:email_app/contactListBuilder.dart';
import 'package:email_app/model/contact.dart';

import 'package:flutter/material.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:sprinkle/WebResourceManager.dart';

class ContactSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    WebResourceManager<Contact> manager =
        context.fetch<WebResourceManager<Contact>>();
    manager.inFilter.add(query);

    return ContactListBuilder(
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
    );
  }
}
