import 'package:email_app/App.dart';
import 'package:flutter/material.dart';

void main() => runApp(emailApp());

class emailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo, accentColor: Colors.indigoAccent
      ),
      home: App(title: "Email App",),
    );
  }
}

