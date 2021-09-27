import 'package:flutter/material.dart';
import 'package:learn_flutter/ContactManager.dart';

class Provider extends InheritedWidget {
  final ContactManager data;

  Provider({Key? key, required Widget child, required this.data})
      : super(key: key, child: child);

  static ContactManager of(BuildContext context) {
    return (context.getElementForInheritedWidgetOfExactType() as Provider).data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => oldWidget != this.data;
}
