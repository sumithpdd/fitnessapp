import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/enums/activity.dart';
import 'package:fitnessapp/models/user_data.dart';
import 'package:fitnessapp/models/user_log.dart';
import 'package:fitnessapp/models/user_model.dart';
import 'package:fitnessapp/utilities/constants.dart';

class DatabaseService {
  static String get users => 'Users';
  static String user(String uid) => 'Users/$uid';
  static String userCart(String uid) => 'Users/$uid/Cart';
  static String userCartItem(String uid, String cid) => 'Users/$uid/Cart/$cid';
  static String get usermeasurements => 'usermeasurements';
  static String get logs => 'Logs';

  String? _idea;
  int? _priority;
  String? _documentID;
  late FirebaseFirestore _firebaseFirestore;
  late FirebaseAuth _auth;
  DatabaseService() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _auth = FirebaseAuth.instance;
  }

  Future<void> addLog({
    required Activity activity,
    required String userId,
  }) async {
    final String path = logs;
    final CollectionReference collection = _firebaseFirestore.collection(path);

    final log = UserLog(
      activity: activity,
      created: DateTime.now(),
      userId: userId,
    );

    await collection.add(log.toJson());
  }

  Future<AppUser> getUser(String userId) async {
    DocumentSnapshot userDoc = await usersRef.doc(userId).get();
    return AppUser.fromDoc(userDoc);
  }

  Future<void> sendIdea(String idea, int priority) async {
    this._idea = idea;
    this._priority = priority;
    try {
      await _firebaseFirestore.collection('ideacollection').add({
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
    await _firebaseFirestore
        .collection('ideacollection')
        .doc(this._documentID)
        .update({'idea': this._idea, 'priority': this._priority}).catchError(
            (e) {
      throw (e);
    });
  }

  Future<void> deleteIdea(String documentID) async {
    this._documentID = documentID;
    await _firebaseFirestore
        .collection('ideacollection')
        .doc(this._documentID)
        .delete()
        .catchError((e) {
      throw (e);
    });
  }

  Future<UserData> getUserMeasurements(String? userId) async {
    try {
      if (userId == null) userId = "1";
      UserData userData = UserData();
      final String collectionName = usermeasurements;
      final Query query = _firebaseFirestore
          .collection(collectionName)
          //   .where('userId', isEqualTo: userId)
          .orderBy('updated', descending: true);

      query.get().then((value) {
        value.docs.forEach((result) {
          userData = UserData.fromJson(result.data() as Map<String, dynamic>);
          print(result.data());
        });
      });
      return userData;
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserMeasurements(UserData userData) async {
    try {
      final String collectionName = usermeasurements;
      await _firebaseFirestore.collection(collectionName).add({
        'userId': userData.currentUserId == null ? 1 : userData.currentUserId,
        'age': userData.age,
        'gender': userData.gender!.toShortString(),
        'height': userData.height,
        'weight': userData.weight,
        'bmi': userData.bmi,
        'bmicategory': userData.bmicategory,
        'bmifatpercentage': userData.bmifatpercentage,
        'created': DateTime.now(),
        'updated': DateTime.now(),
      });
    } catch (e) {
      throw e;
    }
  }
}
