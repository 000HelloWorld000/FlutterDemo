import 'package:flutter/material.dart';
import 'package:learn_flutter/ContactManager.dart';

class FabButton extends StatelessWidget {
  final manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {});
  }
}
