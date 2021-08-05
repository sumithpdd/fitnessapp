import 'package:fitnessapp/utils/FunctinsData.dart';
import 'package:fitnessapp/widget/CardItem.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final _titles;

  LoginScreen(this._titles);

  @override
  _LoginScreenState createState() => _LoginScreenState(_titles);
}

class _LoginScreenState extends State<LoginScreen> {
  var _titles;
  late int currentSelectedIndex;

  _LoginScreenState(this._titles);

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
                AppFunction.getLoginPage(context, _titles[index]);
              });
            },
            headline: _titles[index],
          );
        },
      ),
    );
  }
}
