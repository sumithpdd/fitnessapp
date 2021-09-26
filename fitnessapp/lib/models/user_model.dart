import 'package:cloud_firestore/cloud_firestore.dart';

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
}
