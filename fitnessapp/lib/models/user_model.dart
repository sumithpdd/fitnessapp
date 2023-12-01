import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {
  final String id;
  final String name;
  final String email;
  final String token;
  final String phone;

  AppUser(
      {required this.id,
      required this.name,
      required this.email,
      required this.token,
      required this.phone});

  factory AppUser.fromDoc(DocumentSnapshot doc) {
    return AppUser(
      id: doc.id,
      name: doc['name'],
      email: doc['email'],
      token: doc['token'],
      phone: doc['phone'],
    );
  }
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
