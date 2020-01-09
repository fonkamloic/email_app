import 'dart:async';

import 'package:email_app/manager.dart';
import 'package:email_app/message.dart';
import 'package:email_app/validation.dart';
import 'package:rxdart/rxdart.dart';

class MessageFormManager with Validation implements Manager {
  final BehaviorSubject<String> _email = BehaviorSubject<String>.seeded("@");
  final BehaviorSubject<String> _subject = BehaviorSubject<String>();
  final BehaviorSubject<String> _body = BehaviorSubject<String>();

  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  Stream<String> get subject$ => _subject.stream.transform(validateSubject);

  Sink<String> get inSubject => _subject.sink;

  Stream<String> get body$ => _body.stream;

  Sink<String> get inBody => _subject.sink;


  void setEmail(String value) => inEmail.add(value);

  Message submit() {
    String subject = _subject.value;
    String body = _body.value;

    return Message(subject: subject, body: body);
  }

  Stream<bool> get isFormValid$ async* {
    if(_email.value.isNotEmpty && _subject.value.isNotEmpty && _body.value.isNotEmpty){
      yield true;
    }else
      yield false;
  }

  @override
  void dispose() {
    _body.close();
    _subject.close();
    _email.close();
  }
}
