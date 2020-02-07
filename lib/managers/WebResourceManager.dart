import 'dart:async';

import 'package:email_app/manager.dart';
import 'package:email_app/model/contact.dart';
import 'package:rxdart/rxdart.dart';

abstract class Service<T> {
  Future<List<T>> browse({String filter});
}

class WebResourceManager<T> implements Manager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final BehaviorSubject<int> _countSubject = BehaviorSubject<int>();
  final BehaviorSubject<List<Contact>> _collectionSubject = BehaviorSubject();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;

  Stream<List<Contact>> get browse$ => _collectionSubject.stream;

  WebResourceManager(Service service) {
    _filterSubject
        .debounceTime(Duration(milliseconds: 500))
        .switchMap((filter) async* {
      yield await service.browse(filter: filter);
    }).listen((contacts) async {
      _collectionSubject.add(contacts);
    });

    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
    _countSubject.close();
    _filterSubject.close();
    _collectionSubject.close();
  }
}
