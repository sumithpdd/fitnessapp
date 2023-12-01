import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PieChartPaint extends CustomPainter {
  double? width;
  double? usedSpace;
  double? freeSpace;
  List<ChartModel>? spaceDetails;
  List<Color>? colorList;

  PieChartPaint(usedSpace, freeSpace, width) {
    this.usedSpace = usedSpace;
    this.freeSpace = freeSpace;
    this.width = width;
    spaceDetails = [
      ChartModel(name: 'Free', space: freeSpace),
      ChartModel(name: 'Used', space: usedSpace),
    ];

    colorList = [
      Color.fromRGBO(221, 225, 230, 1),
      Color.fromRGBO(103, 200, 211, 1)
    ];
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width! / 2;

    double total = 0;

    spaceDetails!.forEach((element) => total += element.space!);

    double startRadian = -pi / 2;

    for (int index = 0; index < spaceDetails!.length; index++) {
      var currentSpace = spaceDetails!.elementAt(index);

      var sweepRadian = -(currentSpace.space! / total * 2 * pi);

      paint.color = colorList!.elementAt(index);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        false,
        paint,
      );
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ChartModel {
  String? name;
  double? space;
  ChartModel({@required this.name, @required this.space});
}
