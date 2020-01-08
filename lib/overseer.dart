import 'package:email_app/contactManager.dart';

class OverSeer {
  Map<dynamic, dynamic> repository = {};

  OverSeer() {
    register(ContactManager, ContactManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}
