import 'package:email_app/MessageDetails.dart';
import 'package:email_app/composeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import 'message.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({this.title});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages;

  @override
  void initState() {
    super.initState();

    fetch();
  }

  void fetch() async {
    future = Message.browse();
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                future =  Message.browse();
              });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars1.githubusercontent.com/u/23703424?s=460&v=4"),
              ),
              accountEmail: Text("fonkamloic@gmail.com"),
              accountName: Text("Fonkam Loic"),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Adding new account..."),
                          );
                        });
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.inbox),
              title: Text("Inbox"),
              trailing: Chip(
                label: Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.blue[100],
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.edit),
              title: Text("Draft"),
              trailing: Chip(
                label: Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.red[100],
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.archive),
              title: Text("Archive"),
              trailing: Chip(
                label: Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.red[100],
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.paperPlane),
              title: Text("Sent"),
              trailing: Opacity(
                opacity: 0,
                child: Chip(
                  label:
                      Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                  backgroundColor: Colors.red[100],
                ),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.trash),
              title: Text("Trash"),
              trailing: Chip(
                label: Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.red[100],
              ),
            ),
            Divider(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.toolbox),
                  title: Text("Settings"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("There was an error: ${snapshot.error}");
              }

              var messages = snapshot.data;
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];
                  return Dismissible(
                    onDismissed: (direction){
                      setState(() {

                        messages.removeAt(index);
                      });

                    },
                    background:Container(color: Colors.red[300],),
                    child: ListTile(
                      title: Text(message.subject),
                      subtitle: Text(
                        message.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      isThreeLine: true,
                      leading: CircleAvatar(
                        child: Text("FL"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessageDetail(
                                      subject: message.subject,
                                      body: message.body,
                                    )));
                      },
                    ),
                    key: ObjectKey(message),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: messages.length,
              );
            default:
              return Center();
          }
        },
      ),
      floatingActionButton: ComposeButton(messages: messages),
    );
  }
}
