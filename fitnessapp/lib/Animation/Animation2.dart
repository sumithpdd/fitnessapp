import 'dart:math';
import 'package:flutter/material.dart';
import '../Animation/Bar/bar.dart';

class AnimationTwo extends StatefulWidget {
  @override
  _AnimationTwoState createState() => _AnimationTwoState();
}

class _AnimationTwoState extends State<AnimationTwo>
    with SingleTickerProviderStateMixin {
  static const size = const Size(200.0, 100.0);
  final random = Random();
  AnimationController? animation;
  BarChartTween? tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    tween = BarChartTween(
      BarChart.empty(size),
      BarChart.random(size, random),
    );
    animation!.forward();
  }

  @override
  void dispose() {
    animation!.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      tween = BarChartTween(
        tween!.evaluate(animation!),
        BarChart.random(size, random),
      );
      animation!.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: size,
          painter: BarChartPainter(tween!.animate(animation!)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}
