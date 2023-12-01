import 'package:fitnessapp/helpers/color/constants.dart';
import 'package:fitnessapp/helpers/config/size_config.dart';
import 'package:fitnessapp/models/user_data.dart';
import 'package:fitnessapp/screens/home/widget/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class GenderCard extends StatefulWidget {
  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var usedData = Provider.of<UserData>(context, listen: true);

    return Container(
      height: getProportionateScreenHeight(20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  usedData.gender = Gender.male;
                });
              },
              colour: usedData.gender == Gender.male
                  ? AppColor.buttonbackgroundcolor
                  : AppColor.backgroundcolor,
              cardChild: Container(
                height: getProportionateScreenWidth(50),
                child: Center(
                  child: Text(
                    "Male",
                    style: TextStyle(
                      color: usedData.gender == Gender.male
                          ? AppColor.selectedTextColor
                          : AppColor.unselectedTextColor,
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  usedData.gender = Gender.female;
                });
              },
              colour: usedData.gender == Gender.female
                  ? AppColor.buttonbackgroundcolor
                  : AppColor.backgroundcolor,
              cardChild: Container(
                height: getProportionateScreenWidth(50),
                child: Center(
                  child: Text(
                    "Female",
                    style: TextStyle(
                      color: usedData.gender == Gender.female
                          ? AppColor.selectedTextColor
                          : AppColor.unselectedTextColor,
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
