import 'package:email_app/message_compose.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        String intention = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageCompose(),
          ),
        );
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Your message was sent with $intention"),
            backgroundColor: intention == "Love" ? Colors.greenAccent : Colors.redAccent,
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
