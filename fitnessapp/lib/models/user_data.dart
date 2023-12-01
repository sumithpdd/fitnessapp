import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

enum Gender {
  male,
  female,
}

extension ParseToString on Gender {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

@JsonSerializable(explicitToJson: true)
class UserData extends ChangeNotifier {
  UserData();

  String? currentUserId;
  int height = 180;
  int weight = 60;
  int age = 20;
  double bmi = 20;
  String bmicategory = 'normal';
  double bmifatpercentage = 20;
  Gender? gender;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime created = DateTime.now();

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime updated = DateTime.now();

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  static DateTime _fromJson(Timestamp timestamp) => timestamp.toDate();
  static FieldValue _toJson(DateTime time) => FieldValue.serverTimestamp();
}
