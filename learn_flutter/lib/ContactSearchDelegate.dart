import 'package:flutter/material.dart';
import 'package:learn_flutter/ContactListBuilder.dart';
import 'package:learn_flutter/ContactManager.dart';
import 'package:learn_flutter/Provider.dart';

class ContactSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    ContactManager manager = Provider.of(context);
    if (query.length < 3) {
      return Center(
        child: Text("Your query is: $query"),
      );
    }
    return ContactListBuilder(
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
