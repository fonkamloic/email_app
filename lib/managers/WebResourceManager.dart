import 'dart:async';

import 'package:email_app/manager.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sprinkle/Service.dart';



class WebResourceManager<T> implements Manager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final BehaviorSubject<int> _countSubject = BehaviorSubject<int>();
  final BehaviorSubject<List<T>> _collectionSubject = BehaviorSubject();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;

  Stream<List<T>> get collection$ => _collectionSubject.stream;

  WebResourceManager(Service<T> service) {
    _filterSubject
        .debounceTime(Duration(milliseconds: 500))
        .switchMap((filter) async* {
      yield await service.browse(filter: filter);
    }).listen((elements) async {
      _collectionSubject.add(elements);
    });

    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
    _countSubject.close();
    _filterSubject.close();
    _collectionSubject.close();
  }
}
