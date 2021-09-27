import 'package:flutter/material.dart';
import 'package:learn_flutter/AppDrawer.dart';
import 'package:learn_flutter/Counter.dart';
import 'package:learn_flutter/FabButton.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: Counter(),
      floatingActionButton: FabButton()
    );
  }
}
