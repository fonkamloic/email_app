import 'package:email_app/contactManager.dart';
import 'package:email_app/counterManager.dart';

class OverSeer {
  Map<dynamic, dynamic> repository = {};

  OverSeer() {
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}
