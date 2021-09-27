import 'package:flutter/material.dart';
import 'package:learn_flutter/App.dart';
import 'package:learn_flutter/ContactManager.dart';
import 'package:learn_flutter/Provider.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: ContactManager(),
      child: Builder(builder: (context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.amber, accentColor: Colors.red),
        home: App()
        //MyHomePage(title: 'Flutter Demo Homm Page'),
        )
    ));
  }
}
