import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter/AppDrawer.dart';
import 'package:learn_flutter/MessageList.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(onPressed: () async {}, icon: Icon(Icons.refresh))
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Important", icon: Icon(FontAwesomeIcons.peopleCarry)),
              Tab(text: "Other", icon: Icon(FontAwesomeIcons.pepperHot))
            ],
          ),
        ),
        drawer: AppDrawer(),
         body: TabBarView(children: <Widget>[
          MyHomePage(title: "Tab Message"),
          MyHomePage(title: "Tab Message", status: "Other")
         ]
        )
    ));
  }
}
