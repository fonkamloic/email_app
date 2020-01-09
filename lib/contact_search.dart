import 'package:email_app/contactListBuilder.dart';
import 'package:email_app/contactManager.dart';
import 'package:email_app/model/contact.dart';
import 'package:email_app/provider.dart';
import 'package:flutter/material.dart';

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
  Widget buildSuggestions(BuildContext context) { ContactManager manager = Provider.of(context).fetch(ContactManager);
  manager.inFilter.add(query);
//  if (query.length < 3) {
//    return Center(
//      child: Text("Type at least 3 letters to search"),
//    );
//  } else
    return ContactListBuilder(
      stream: manager.browse$,
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
