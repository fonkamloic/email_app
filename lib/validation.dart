import 'dart:async';

mixin Validation {
  static bool isEmail(String email) => email.contains("@");

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      sink.add(value);
    } else {
      sink.addError("Enter a valid email address");
    }
  });

  final validateSubject =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length < 3 || value == null) {
      sink.addError("Subject must be more that 3 characteres");
    } else {
      sink.add(value);
    }
  });


}
