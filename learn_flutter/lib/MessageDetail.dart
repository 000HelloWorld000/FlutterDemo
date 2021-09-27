

import 'package:flutter/material.dart';
import 'package:learn_flutter/data/Message.dart';

class MessageDetail extends StatelessWidget {
  late final String title;
  late final String message;

  MessageDetail(this.title, this.message);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Text(message),
      ),
    );
  }
}
