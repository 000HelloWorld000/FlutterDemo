import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'Message.g.dart';

@JsonSerializable()
class Message {
  late String subject;
  late String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse({String status = "important"}) async {
    String url = status == "important"
        ? "https://run.mocky.io/v3/a18ec140-1e41-4d22-a5e6-1ff60a8f5ad6"
        : "https://run.mocky.io/v3/aff6be96-fe1f-49ad-ae44-da3a3e3973ae";
    http.Response respone = await http.get(Uri.parse(url));
    // var content = await rootBundle.loadString('lib/data/message.json');

    await Future.delayed(Duration(seconds: 1));

    List collection = json.decode(respone.body);
    List<Message> _message =
        collection.map((json) => Message.fromJson(json)).toList();
    return _message;
  }
}
