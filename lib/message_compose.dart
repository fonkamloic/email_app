import 'package:email_app/message.dart';
import 'package:email_app/messageFormManager.dart';
import 'package:email_app/provider.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {


  @override
  Widget build(BuildContext context) {
    MessageFormManager messageFormManager =
        Provider.of(context).fetch(MessageFormManager);
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose New Message"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: StreamBuilder<String>(
                  stream: messageFormManager.email$,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: messageFormManager.inEmail.add,
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                        labelText: "TO",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: StreamBuilder<String>(
                    stream: messageFormManager.subject$,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: messageFormManager.inSubject.add,
                        decoration: InputDecoration(
                          errorText: snapshot.error,
                          labelText: "SUBJECT",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
              ),
              Divider(),
              ListTile(
                title: StreamBuilder<String>(
                    stream: messageFormManager.body$,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: messageFormManager.inBody.add,
                        maxLines: 5,
                        decoration: InputDecoration(
                          errorText: snapshot.error,
                          labelText: "BODY",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
              ),
              ListTile(
                title: StreamBuilder<bool>(
                    stream: messageFormManager.isFormValid$,
                    builder: (context, snapshot) {
                      return RaisedButton(
                        child: Text("SEND"),
                        onPressed: ()async {
                          if (snapshot.hasData) {
                            Message message = await messageFormManager.submit();
                            Navigator.pop(context, message);
                            print("yes");
                          } else
                            print(snapshot.data);
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*

   Text(
              "Compose New Message",
              style: Theme.of(context).textTheme.title,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                    child: Text("Love"),
                    onPressed: () {
                      Navigator.pop(context, "Love");
                    }),
                RaisedButton(
                  child: Text("Hate"),
                  onPressed: () {
                    Navigator.pop(context, "Hate");
                  },
                ),
              ],
            )
  */
