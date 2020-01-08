import 'package:flutter/material.dart';

class Observer<T> extends StatelessWidget {
  final Stream<T> stream;

  final Function onError;
  final Function onSuccess;
  final Function onWaiting;

  Observer(
      {this.onError,
      @required this.onSuccess,
      @required this.stream,
      this.onWaiting});

  Function get _defaultProgressIndicator => (context) => Center(
        child: CircularProgressIndicator(),
      );

  Function get _defaultOnError => (context, error) => Text(error);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onError != null
              ? onError(context, snapshot.error)
              : _defaultOnError(context, snapshot.error);
        }
        if (snapshot.hasData) {
          T data = snapshot.data;
          return onSuccess(context, data);
        } else {
          return onWaiting != null
              ? onWaiting(context)
              : _defaultProgressIndicator(context);
        }
      },
    );
  }
}
