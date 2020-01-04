import 'package:email_app/message.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = "";
  String subject = '';
  String body = '';
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose New Message"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  validator: (value){
                    return  value.contains("@") ? null : "Must be a valid email";
                  },
                  onSaved: (value) => to = value,
                  decoration: InputDecoration(
                    labelText: "TO",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value){
                   if(value.length < 4){
                     return "Subject must be more that 4 characteres";
                   }else
                     return null;
                  },
                  onSaved: (value) => subject = value,

                  decoration: InputDecoration(
                    labelText: "SUBJECT",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  validator: (value){
                    if(value.length == 0){
                      return "Body can't be empty";
                    }
                    else
                      return null;
                  },
                  onSaved: (value) => body = value,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "BODY",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                title: RaisedButton(
                  child: Text("SEND"),
                  onPressed: () async{
                    if(this.key.currentState.validate()){
                      await this.key.currentState.save();
                      Message message = Message(subject: subject, body: body);
                      Navigator.pop(context, message);
                    }

                  },
                ),
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
