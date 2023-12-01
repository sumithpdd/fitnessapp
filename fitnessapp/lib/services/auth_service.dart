import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitnessapp/models/user_model.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Stream<User?> get user => _auth.authStateChanges();

  String? get getDisplayName => _auth.currentUser!.displayName;

  Future<void> signup(
      String name, String email, String password, String phone) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        String? token = await _messaging.getToken();
        usersRef.doc(authResult.user!.uid).set({
          'name': name,
          'email': email,
          'token': token,
          'phont': phone,
        });
      }
    } on PlatformException catch (err) {
      throw (err);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on PlatformException catch (err) {
      throw (err);
    }
  }

  Future<void> logout() async {
    await removeToken();
    Future.wait([
      _auth.signOut(),
    ]);
  }

  Future<void> removeToken() async {
    final currentUser = _auth.currentUser!;
    await usersRef.doc(currentUser.uid).set({'token': ''});
  }

  Future<void> updateToken() async {
    final currentUser = _auth.currentUser!;
    final token = await _messaging.getToken();
    final userDoc = await usersRef.doc(currentUser.uid).get();
    if (userDoc.exists) {
      AppUser user = AppUser.fromDoc(userDoc);
      if (token != user.token) {
        usersRef.doc(currentUser.uid).set({'token': token});
      }
    }
  }
}
