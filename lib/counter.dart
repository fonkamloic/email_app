import 'package:email_app/managers/counterManager.dart';
import 'package:email_app/observer.dart';
import 'package:email_app/provider.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
    return Center(
      child: Observer<int>(
        stream: manager.counter$,
        onSuccess: (context, data) {
          return Text("Calendar: $data");
        },
      ),
    );
  }
}
