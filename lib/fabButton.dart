import 'package:email_app/managers/counterManager.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/SprinkleExtension.dart';

class FabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CounterManager manager = context.fetch<CounterManager>();
    return FloatingActionButton(onPressed: manager.increment,);
  }
}
