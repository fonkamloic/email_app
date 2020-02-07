import 'package:email_app/App.dart';
import 'package:email_app/managers/counterManager.dart';
import 'package:email_app/managers/messageFormManager.dart';
import 'package:email_app/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/Overseer.dart';
import 'package:sprinkle/Provider.dart';
import 'package:sprinkle/WebResourceManager.dart';

import 'services/contactService.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer()
          .register<MessageFormManager>(() => MessageFormManager())
          .register<CounterManager>(() => CounterManager())
          .register<WebResourceManager<Contact>>(
              () => WebResourceManager<Contact>(ContactService())),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.indigo, accentColor: Colors.indigoAccent),
        home: App(
          title: "Email App",
        ),
      ),
    );
  }
}
