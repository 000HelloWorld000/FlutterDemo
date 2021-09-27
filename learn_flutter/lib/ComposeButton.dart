import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_flutter/MessageCompose.dart';
import 'package:learn_flutter/data/Message.dart';

class ComposeButton extends StatelessWidget {
  List<Message> messages = [];
  ComposeButton(this.messages);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Message message = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MessageCompose()));
          messages.add(message);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(message.body),
            backgroundColor: Colors.orange,
          ));
        },
      ),
    );
  }
}
