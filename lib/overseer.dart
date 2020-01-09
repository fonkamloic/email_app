import 'package:email_app/managers/contactManager.dart';
import 'package:email_app/managers/counterManager.dart';
import 'package:email_app/manager.dart';
import 'package:email_app/managers/messageFormManager.dart';

class OverSeer {
  Map<dynamic, Manager> repository = {};

  Map<dynamic, Function> _factories = {
    ContactManager: () => ContactManager(),
    CounterManager: () => CounterManager(),
    MessageFormManager: () => MessageFormManager()
  };

//  OverSeer() {
//    register(ContactManager, ContactManager());
//    register(CounterManager, CounterManager());
//    register(MessageFormManager, MessageFormManager());
//  }

  _summon(name) => repository[name] = _factories[name]();

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) =>
      repository.containsKey(name) ? repository[name] : _summon(name);

  release(name) {
    Manager manager = repository[name];
    manager.dispose();

    repository.remove(name);
  }
}
