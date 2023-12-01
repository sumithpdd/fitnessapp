import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/enums/activity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_log.g.dart';

@JsonSerializable(explicitToJson: true)
class UserLog {
  UserLog({
    this.id,
    required this.activity,
    required this.created,
    required this.userId,
  });
  final Activity activity;
  final String? id;
  final String userId;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime created;

  factory UserLog.fromJson(Map<String, dynamic> json) =>
      _$UserLogFromJson(json);
  Map<String, dynamic> toJson() => _$UserLogToJson(this);

  static DateTime _fromJson(Timestamp timestamp) => timestamp.toDate();
  static FieldValue _toJson(DateTime time) => FieldValue.serverTimestamp();
}
