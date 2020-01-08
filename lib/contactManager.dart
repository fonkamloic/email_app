import 'dart:async';

import 'package:email_app/model/contact.dart';
import 'package:email_app/services/contactService.dart';
import 'package:rxdart/rxdart.dart';

class ContactManager {
  final BehaviorSubject<int> _countCounter = BehaviorSubject<int>();

  Stream<int> get contactCounter => _countCounter.stream;

  Stream<int> filteredCounter({query}) => _countCounter.stream;

  Stream<List<Contact>> get contactListNow async* {
    yield await ContactService.browse();

//   Stream.fromFuture(ContactService.browse());
  }

  Stream<List<Contact>> filteredContactList({query}) async* {
    yield await ContactService.browse(query: query);
  }

  //  Stream.fromFuture(ContactService.browse(query: query));

  ContactManager() {
    contactListNow.listen((list) => _countCounter.add(list.length));
  }
}
