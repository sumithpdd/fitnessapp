import 'package:flutter/material.dart';

class Exercise {
  final String? exerciseId;
  final String? exerciseName;
  final String? exerciseGroup;
  final String? exerciseImage;
  final String? exerciseVideo;
  final int? estimatedTime;

  Exercise(
      {@required this.exerciseId,
      @required this.exerciseName,
      @required this.exerciseGroup,
      @required this.exerciseImage,
      @required this.exerciseVideo,
      @required this.estimatedTime});
}
