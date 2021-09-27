import 'package:flutter/material.dart';
import 'package:learn_flutter/AppDrawer.dart';
import 'package:learn_flutter/ContactCounter.dart';
import 'package:learn_flutter/ContactListBuilder.dart';
import 'package:learn_flutter/ContactSearchDelegate.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: AppDrawer(),
            appBar: AppBar(
              title: Text("Contact"),
              actions: [
                ContactCounter(),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                        context: context, delegate: ContactSearchDelegate());
                  },
                ),
                Padding(padding: EdgeInsets.only(right: 16)),
              ],
            ),
            body: ContactListBuilder(
              builder: (context, contacts) {
                return ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(contacts[index].name),
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: contacts.length);
              },
            )));
  }
}
