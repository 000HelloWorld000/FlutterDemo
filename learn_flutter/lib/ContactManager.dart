import 'dart:async';
import 'package:learn_flutter/ContactService.dart';
import 'package:learn_flutter/data/Contact.dart';
import 'package:rxdart/rxdart.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();

  Stream<int> get contactCounter => _contactCounter.stream;

  Stream<List<Contact>> get contactListView =>
      Stream<List<Contact>>.fromFuture(ContactService.browse());

  Stream<List<Contact>> filterQueryContact({query}) =>
      Stream<List<Contact>>.fromFuture(ContactService.browse(query: query));

  ContactManager() {
    contactListView.listen((list) {
      _contactCounter.add(list.length);
    },
        onDone: () => print("Done!!"),
        onError: (error) => print("Loi roi $error!!"));
  }
}
