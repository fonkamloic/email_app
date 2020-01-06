import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message({this.body, this.subject});

  factory Message.fromJson(Map<String, dynamic> msg) => _$MessageFromJson(msg);

//    : subject = msg["subject"],
//        body = msg["body"];

  static Future<List<Message>> browse({status = "important"}) async {
    //String content = await rootBundle.loadString('data/messages.json');
    String url = status == "important"
        ? "http://www.mocky.io/v2/5e1527dd2d000060851674e1"
        : "http://www.mocky.io/v2/5e10880d35000066001e696e";
    http.Response response = await http.get(url);

    // http://www.mocky.io/v2/5e1527dd2d000060851674e1

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}
