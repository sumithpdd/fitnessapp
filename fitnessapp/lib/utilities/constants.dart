import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;
final usersRef = _db.collection('users');

final FirebaseStorage _storage = FirebaseStorage.instance;
final storageRef = _storage.ref();

final DateFormat timeFormat = DateFormat('E, h:mm a');

const TextStyle kideastyle =
    TextStyle(fontWeight: FontWeight.w200, fontSize: 25, color: Colors.white);

const TextStyle ktaskfontstyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Lora',
    fontSize: 25,
    color: kthemecolour);

const kthemecolour = Color(0XFFFDC57E);

const TextStyle ksidetextstyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Lora',
    fontSize: 25,
    color: Colors.white);
const TextStyle ktextfieldstyle =
    TextStyle(fontWeight: FontWeight.w200, fontSize: 20, color: kthemecolour);
