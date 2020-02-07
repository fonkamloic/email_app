import 'package:flutter/material.dart';
import 'package:email_app/overseer.dart';
import 'package:flutter/cupertino.dart';

class Provider extends InheritedWidget{
  final Overseer data;
  Provider({Key key, Widget child, this.data}): super(key: key, child: child);

  static Overseer of(BuildContext context){
    return (context.getElementForInheritedWidgetOfExactType<Provider>().widget as Provider).data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }




}