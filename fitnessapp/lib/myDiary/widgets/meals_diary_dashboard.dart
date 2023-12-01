import 'package:fitnessapp/UIview/diet_view_dashboard.dart';
import 'package:fitnessapp/UIview/titleView.dart';
import 'package:flutter/material.dart';

import '../mealsListView.dart';

class MealsDiaryDashboard extends StatelessWidget {
  const MealsDiaryDashboard({
    Key? key,
    required this.animationController,
    required this.count,
  }) : super(key: key);
  final AnimationController? animationController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView(
          titleTxt: 'Mediterranean diet',
          subTxt: 'Details',
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: this.animationController!,
              curve:
                  Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: this.animationController!,
        ),
        DietViewDashboard(
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animationController!,
              curve:
                  Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: animationController!,
        ),
        TitleView(
          titleTxt: 'Meals today',
          subTxt: 'Customize',
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animationController!,
              curve:
                  Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: animationController!,
        ),
        MealsListView(
          mainScreenAnimation: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: animationController!,
                  curve: Interval((1 / count) * 3, 1.0,
                      curve: Curves.fastOutSlowIn))),
          mainScreenAnimationController: animationController!,
        ),
      ],
    );
  }
}
