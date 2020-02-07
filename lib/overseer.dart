import 'package:email_app/managers/WebResourceManager.dart';
import 'package:email_app/managers/counterManager.dart';
import 'package:email_app/manager.dart';
import 'package:email_app/managers/messageFormManager.dart';
import 'package:email_app/model/contact.dart';
import 'package:email_app/services/contactService.dart';

class Overseer {
  Map<dynamic, Manager> repository = {};

  Map<dynamic, Function> _factories = {

  };
//  OverSeer(this._factories);

//  OverSeer() {
//    register(ContactManager, ContactManager());
//    register(CounterManager, CounterManager());
//    register(MessageFormManager, MessageFormManager());
//  }

  _summon(name) => repository[name] = _factories[name]();

  Overseer register<T>(_factory) {
    _factories[T] = _factory;

    return this;
  }

  fetch(name) =>
      repository.containsKey(name) ? repository[name] : _summon(name);

  release(name) {
    Manager manager = repository[name];
    manager.dispose();

    repository.remove(name);
  }
}
