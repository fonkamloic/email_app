import 'package:flutter/material.dart';

class RxTextField<T> extends StatelessWidget {
  final Stream<T> subscribe;
  final Function dispatch;
  final InputDecoration decoration;


  RxTextField(
      {@required this.subscribe, @required this.dispatch, this.decoration});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: subscribe,
      builder: (context, snapshot) {
        return TextField(
          onChanged: dispatch,
          decoration: decoration,
        );
      },
    );
  }
}
