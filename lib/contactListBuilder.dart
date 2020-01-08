import 'package:email_app/model/contact.dart';
import 'package:email_app/observer.dart';
import 'package:flutter/material.dart';

class ContactListBuilder extends StatelessWidget {
  final Function builder;
  final Stream stream;

  ContactListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,
      onSuccess: (BuildContext context, List<Contact> data) {
        return builder(context, data);
      },
    );
  }
}
