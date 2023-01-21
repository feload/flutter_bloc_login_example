import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({super.key, required super.child});

  static Bloc of(BuildContext context) {
    // The inheritFromWidgetOfExactType "Provider" function will search for a widget of type
    // "Provider" all the way up in the context chain.
    return (context.dependOnInheritedWidgetOfExactType<Provider>())!.bloc;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
