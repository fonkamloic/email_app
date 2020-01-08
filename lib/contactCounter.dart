import 'package:email_app/contactManager.dart';
import 'package:email_app/observer.dart';
import 'package:email_app/provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return Chip(
      label: Observer<int>(
          stream: manager.count$,
         onSuccess: (context, data) {
            return Text(
              (data ?? 0).toString(),
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            );
          }),
      backgroundColor: Colors.red,
    );
  }
}
