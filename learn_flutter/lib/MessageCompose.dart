import 'package:flutter/material.dart';
import 'package:learn_flutter/data/Message.dart';

class MessageCompose extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageCompose();
}

class _MessageCompose extends State<MessageCompose> {
  late String? to;
  late String? body;
  late String? subject;

  final key = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Compose New Message")),
        body: SingleChildScrollView(
            child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                  title: TextFormField(
                      validator: (value) => !value!.contains('@')
                          ? "TO field must be a valid type"
                          : null,
                      onSaved: (value) => to = value,
                      decoration: InputDecoration(
                          icon: Icon(Icons.add),
                          labelText: "TO",
                          labelStyle: TextStyle(fontWeight: FontWeight.w100)))),
              ListTile(
                  title: TextFormField(
                    validator: (value) {
                      int len = value!.length;
                      if (len == 0) {
                        return "SUBJECT CANNOT EMPTY"; 
                      } else if ( len < 4) {
                        return "SUBJECT must be longer than 4 characters"; 
                      }
                      return null;
                    },
                      onSaved: (value) {
                        subject = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Subject",
                          labelStyle: TextStyle(fontWeight: FontWeight.w100)))),
              Divider(),
              ListTile(
                title: TextFormField(
                  onSaved: (value) {
                    body = value;
                  },
                  maxLines: 9,
                  decoration: InputDecoration(
                      labelText: "Body",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              ListTile(
                title: RaisedButton(
                    child: Text("SEND"),
                    onPressed: () {
                      if (this.key.currentState?.validate() == true) {
                        this.key.currentState?.save();
                        Message message = Message(subject ?? "", body ?? "");

                        Navigator.pop(context, message);
                      }
                    }),
              )
            ],
          ),
        )));
  }
}
