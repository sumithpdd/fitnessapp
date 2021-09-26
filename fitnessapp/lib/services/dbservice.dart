import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/models/user_model.dart';
import 'package:fitnessapp/utilities/constants.dart';

class FireStoreDB {
  String? _idea;
  int? _priority;
  String? _documentID;
  late FirebaseFirestore _ideaobject;
  late FirebaseAuth _auth;
  FireStoreDB() {
    _ideaobject = FirebaseFirestore.instance;
    _auth = FirebaseAuth.instance;
  }
  Future<AppUser> getUser(String userId) async {
    DocumentSnapshot userDoc = await usersRef.doc(userId).get();
    return AppUser.fromDoc(userDoc);
  }

  Future<void> sendIdea(String idea, int priority) async {
    this._idea = idea;
    this._priority = priority;
    try {
      await _ideaobject.collection('ideacollection').add({
        'idea': this._idea,
        'priority': this._priority,
        'user': _auth.currentUser?.phoneNumber
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateIdea(String documentID, String idea, int priority) async {
    this._idea = idea;
    this._priority = priority;
    this._documentID = documentID;
    print('Updating idea value');
    await _ideaobject.collection('ideacollection').doc(this._documentID).update(
        {'idea': this._idea, 'priority': this._priority}).catchError((e) {
      throw (e);
    });
  }

  Future<void> deleteIdea(String documentID) async {
    this._documentID = documentID;
    await _ideaobject
        .collection('ideacollection')
        .doc(this._documentID)
        .delete()
        .catchError((e) {
      throw (e);
    });
  }
}
