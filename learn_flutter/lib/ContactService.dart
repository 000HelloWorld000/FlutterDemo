import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_flutter/data/Contact.dart';

class ContactService {
  static String url = "https://jsonplaceholder.typicode.com/users";
  static Future<List<Contact>> browse({query}) async {
    http.Response response = await http.get(Uri.parse(url));

    String contentUrl = response.body;
    List collection = json.decode(contentUrl);

    Iterable<Contact> contacts =
        collection.map((json) => Contact.fromJson(json)).toList();
    if (query != null && query.isNotEmpty) {
      contacts = contacts
          .where((contact) => contact.name.toLowerCase().contains(query));
    }
    return contacts.toList();
  }
}
