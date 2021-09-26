import 'package:fitnessapp/utilities/FunctinsData.dart';
import 'package:flutter/material.dart';
import '../widget/CardItem.dart';

class AnimationScreen extends StatefulWidget {
  final _titles;

  AnimationScreen(this._titles);

  @override
  AnimScreenState createState() => AnimScreenState(_titles);
}

class AnimScreenState extends State<AnimationScreen> {
  var _titles;
  late int currentSelectedIndex;

  AnimScreenState(this._titles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: _titles.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return CustomWidget(
            index: index,
            isSelected: currentSelectedIndex == index,
            onSelect: () {
              setState(() {
                currentSelectedIndex = index;
                AppFunction.getAnimationDashboardPage(context, _titles[index]);
              });
            },
            headline: _titles[index],
          );
        },
      ),
    );
  }
}
