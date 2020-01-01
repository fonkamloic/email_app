import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';


@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message({this.body, this.subject});

 factory  Message.fromJson(Map<String, dynamic> msg)  => _$MessageFromJson(msg);
//    : subject = msg["subject"],
//        body = msg["body"];


}
