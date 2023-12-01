import 'package:fitnessapp/models/exercise.dart';
import 'package:flutter/material.dart';

class MyExerciseHistory {
  final String? exerciseDay;
  final String? exerciseName;
  final int? repetition;
  final int? sets;
  final int? weight;
  DateTime? exerciseDate;
  MyExerciseHistory(
      {@required this.exerciseDay,
      @required this.exerciseName,
      @required this.repetition,
      @required this.sets,
      @required this.weight,
      @required this.exerciseDate});
}

class Workout {
  // When this workout was performed.
  DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(date!);

  // Timestamp of this workout in millis since epoch.
  int? date;

  // [Exercise]s performed on that day.
  List<Exercise>? exercises;
}
