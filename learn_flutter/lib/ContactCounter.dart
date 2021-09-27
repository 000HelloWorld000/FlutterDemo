import 'package:flutter/material.dart';
import 'package:learn_flutter/ContactManager.dart';
import 'package:learn_flutter/Provider.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);

    return StreamBuilder<int>(
        stream: manager.contactCounter,
        builder: (context, snapshot) {
          int contacts = snapshot.data ?? 0;
          return Chip(
              label: Text(
            "$contacts",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ));
        });
  }
}
