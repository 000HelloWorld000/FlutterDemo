import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter/ComposeButton.dart';
import 'package:learn_flutter/MessageDetail.dart';
import 'package:learn_flutter/data/Message.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final String status;

  const MyHomePage({Key? key, required this.title, this.status = 'important'}): super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageList();
}

class _MessageList extends State<MyHomePage> {
  late Future<List<Message>> future;
  List<Message> messages = [];

  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    future = Message.browse(status: widget.status);
    messages = await future;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              var messages = snapshot.data;
              if (snapshot.hasError) return Text("No data and has error");
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    Message message = messages[index];
                    return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        key: ObjectKey(message),
                        actions: [
                          IconSlideAction(
                              caption: "Delete",
                              color: Colors.red,
                              icon: FontAwesomeIcons.trash,
                              onTap: () => setState(() {
                                    messages.removeAt(index);
                                  }))
                        ],
                        secondaryActions: [
                          IconSlideAction(
                              caption: "Delete",
                              color: Colors.red,
                              icon: FontAwesomeIcons.trash,
                              onTap: () => setState(() {
                                    messages.removeAt(index);
                                  }))
                        ],
                        child: ListTile(
                          title: Text(message.subject),
                          isThreeLine: true,
                          leading: CircleAvatar(
                            child: Text('NN'),
                          ),
                          subtitle: Text(
                            message.body,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MessageDetail(
                                            message.subject, message.body)));
                          },
                        ));
                  });
          }
        },
      ),
      floatingActionButton: ComposeButton(messages),
    );
  }
}
