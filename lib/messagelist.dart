import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'message.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({this.title});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messages = [];

  Future loadMessageList() async {
    //String content = await rootBundle.loadString('data/messages.json');
     http.Response response = await http.get("http://www.mocky.io/v2/5e10880d35000066001e696e");
    String content = response.body;
    List collection = json.decode(content);
    List<Message>  _messages = collection.map((json) => Message.fromJson(json)).toList();

    setState(() {
    messages = _messages;
    });
  }

  @override
  void initState() {
    loadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          Message message = messages[index];
          return ListTile(
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
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: messages.length,
      ),
    );
  }
}
