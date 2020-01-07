import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'message.g.dart';


@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message({this.body, this.subject});

 factory  Message.fromJson(Map<String, dynamic> msg)  => _$MessageFromJson(msg);
//    : subject = msg["subject"],
//        body = msg["body"];

  static Future<List<Message>> browse() async {
    //String content = await rootBundle.loadString('data/messages.json');
    http.Response response = await http.get("http://www.mocky.io/v2/5e10880d35000066001e696e");
    String content = response.body;
    List collection = json.decode(content);
    List<Message>  _messages = collection.map((json) => Message.fromJson(json)).toList();

    return _messages;

  }
}
