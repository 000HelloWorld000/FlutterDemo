
import 'package:json_annotation/json_annotation.dart';

part 'Contact.g.dart';

@JsonSerializable()
class Contact {
  late String name;
  late String phone;
  late String email;
  Contact(this.name, this.phone, this.email);


  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}
