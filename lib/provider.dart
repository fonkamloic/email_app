
import 'package:email_app/overseer.dart';
import 'package:flutter/cupertino.dart';

class Provider extends InheritedWidget{
  final OverSeer data;
  Provider({Key key, Widget child, this.data}): super(key: key, child: child);

  static OverSeer of(BuildContext context){
    return (context.getElementForInheritedWidgetOfExactType<Provider>().widget as Provider).data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }




}