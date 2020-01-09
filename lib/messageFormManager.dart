import 'dart:async';

import 'package:email_app/message.dart';
import 'package:email_app/validation.dart';
import 'package:rxdart/rxdart.dart';

class MessageFormManager with Validation {
  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  final BehaviorSubject<String> _subject = BehaviorSubject<String>();
  final BehaviorSubject<String> _body = BehaviorSubject<String>();

  Stream<String> get email$ => _email.stream.transform(validateEmail);

  Sink<String> get inEmail => _email.sink;

  Stream<String> get subject$ => _subject.stream.transform(validateSubject);

  Sink<String> get inSubject => _subject.sink;

  Stream<String> get body$ => _body.stream;

  Sink<String> get inBody => _subject.sink;


  Message submit() {
    String subject = _subject.value;
    String body = _body.value;

    return Message(subject: subject, body: body);
  }

  Stream<bool> get isFormValid$ =>
      CombineLatestStream([_email.stream,_body.stream, _subject.stream], (value) => true);
}
