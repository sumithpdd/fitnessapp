import 'package:flutter/material.dart';

class MyExercisePlan {
  final String? exerciseDay;
  final String? exerciseName;
  final int? repetition;
  final int? sets;
  final int? weight;

  MyExercisePlan(
      {@required this.exerciseDay,
      @required this.exerciseName,
      @required this.repetition,
      @required this.sets,
      @required this.weight});
}
