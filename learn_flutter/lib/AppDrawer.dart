import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("My name"),
            accountEmail: Text("myemail@m.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://yt3.ggpht.com/yti/APfAmoFJGnbbLXNvyPAnK5yqG3vtHZTA7iWUMjCLoQ=s88-c-k-c0x00ffffff-no-rj-mo"),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                  child: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Add new account..."),
                          );
                        });
                  })
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            trailing: Chip(
              label: Text(
                "11",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue[100],
            ),
            title: Text("Text 1"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.trash),
            title: Text("Text 2"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.archive),
            title: Text("Text 3"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text("Text 4"),
          ),
          Divider(),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.cog),
              title: Text("Text 4"),
            ),
          ))
        ],
      ),
    );
  }
}
