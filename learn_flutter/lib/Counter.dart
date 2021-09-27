import 'package:flutter/widgets.dart';
import 'package:learn_flutter/ContactManager.dart';

class Counter extends StatelessWidget {
  final manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        initialData: 0,
        stream: manager.contactCounter,
        builder: (context, snapshot) {
          return Text("Calendar: +${snapshot.data}");
        },
      ),
    );
  }
}
