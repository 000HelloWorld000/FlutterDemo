import 'package:flutter/material.dart';
import 'package:learn_flutter/ContactManager.dart';
import 'package:learn_flutter/Provider.dart';
import 'package:learn_flutter/data/Contact.dart';

class ContactListBuilder extends StatelessWidget {
  final Function builder;

  ContactListBuilder({required this.builder});

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);

    return StreamBuilder<List<Contact>>(
        stream: manager.contactListView,
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              List<Contact> contacts = snapshot.data ?? [Contact("", "", "")];
              return builder(context, contacts);
          }
        });
  }
}
