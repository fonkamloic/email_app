import 'package:email_app/contactManager.dart';
import 'package:email_app/overseer.dart';
import 'package:email_app/provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return Chip(
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
    );
  }
}
