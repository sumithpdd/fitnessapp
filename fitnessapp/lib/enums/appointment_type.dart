import 'package:flutter/foundation.dart';

enum AppointmentType {
  Yoga,
  Gym,
  HIIT,
  PersonalTraining,
  Run,
  Walk,
}

extension ActivityExtension on AppointmentType {
  String get name {
    return describeEnum(this);
  }

  String get toShortString {
    return this.toString().split('.').last;
  }
}
