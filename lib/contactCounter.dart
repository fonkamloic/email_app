import 'package:email_app/model/contact.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/WebResourceManager.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WebResourceManager<Contact> manager =
        context.fetch<WebResourceManager<Contact>>();

    return Chip(
      label: Observer<int>(
          stream: manager.count$,
          onSuccess: (context, data) {
            return Text(
              (data ?? 0).toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            );
          }),
      backgroundColor: Colors.red,
    );
  }
}
