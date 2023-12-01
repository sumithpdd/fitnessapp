import 'dart:ui';

import 'package:fitnessapp/helpers/color/constants.dart';
import 'package:fitnessapp/helpers/components/widget/bottom_button.dart';
import 'package:fitnessapp/helpers/config/size_config.dart';
import 'package:fitnessapp/helpers/components/appbarbutton.dart';
import 'package:fitnessapp/helpers/components/custom_appbar.dart';
import 'package:fitnessapp/screens/profile/profile.dart';
import 'package:fitnessapp/screens/tips/widget/tipsHeader.dart';
import 'package:fitnessapp/screens/tips/widget/tipsfooter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

// ignore: must_be_immutable
class TipsScreen extends StatelessWidget {
  List cycleList = [
    "Always wear a helmet when riding.",
    " Protect your head.",
    "Keep your head up while cycling.",
    "Don't ride with headphones on.",
    "Get a proper bike fit.",
    "Use your gears.",
    " Don't pedal in high gear for extended periods of time.",
  ];
  List runList = [
    "Stretching after a run is just as important, if not more important as before your run.",
    "Warm-up before you run.",
    "Opt for comfortable, sweat-wicking clothing.",
    "Increase Your Mileage Gradually",
    "What you eat affects not only your overall health but also your risk of running-related injury.",
    "A properly fitting pair of running shoes is the most important piece of gear for running.",
  ];
  List swimList = [
    "Make sure you know how to swim.",
    "Choose a safe environment.",
    "Warm up and stretch your muscles and joints before entering the water.",
    "Have plenty of fluids on hand and drink regularly.",
    "Get some breathing practice. Breathing is the key to a successful stroke.",
    "You should wash your swimming gear thoroughly after each swim to ensure that you are getting rid of the chlorine.",
    "Goggles are an essential part of swimming correctly and they can mist up if they are not looked after.",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: CustomAppBar(
        onpressed: () {
          print("pressed");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(),
            ),
          );
        },
        backgroundcolor: Colors.transparent,
        title: 'Good Tips',
        leading: AppBarButton(
          icon: Icons.arrow_back,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: AppColor.backgroundcolor,
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            TipsHeader(),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            FooterTipsWidget(
              ontap: () {
                int randomIndex = Random().nextInt(runList.length);

                Get.defaultDialog(
                  title: "Running Tips",
                  titlePadding: EdgeInsets.only(top: 25),
                  titleStyle: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: AppColor.unselectedTextColor),
                  content: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      runList[randomIndex],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: AppColor.unselectedTextColor),
                    ),
                  ),
                  actions: [
                    BottomButton(
                      buttonTitle: 'Ok',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: AppColor.selectedTextColor,
                      ),
                      onTap: () {
                        Get.back();
                      },
                      width: getProportionateScreenWidth(60),
                      height: getProportionateScreenHeight(60),
                      colour: AppColor.buttonbackgroundcolor,
                    ),
                  ],
                );
              },
              logo: Icons.directions_run,
              title: "Running",
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            FooterTipsWidget(
              ontap: () {
                int randomIndex = Random().nextInt(cycleList.length);

                Get.defaultDialog(
                  title: "Cycling Tips",
                  titlePadding: EdgeInsets.only(top: 25),
                  titleStyle: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: AppColor.unselectedTextColor),
                  content: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      cycleList[randomIndex],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: AppColor.unselectedTextColor),
                    ),
                  ),
                  actions: [
                    BottomButton(
                      buttonTitle: 'Ok',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: AppColor.selectedTextColor,
                      ),
                      onTap: () {
                        Get.back();
                      },
                      width: getProportionateScreenWidth(60),
                      height: getProportionateScreenHeight(60),
                      colour: AppColor.buttonbackgroundcolor,
                    ),
                  ],
                );
              },
              logo: Icons.pedal_bike,
              title: "Cycling",
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            FooterTipsWidget(
              ontap: () {
                int randomIndex = Random().nextInt(swimList.length);

                Get.defaultDialog(
                  title: "Swimming Tips",
                  titlePadding: EdgeInsets.only(top: 25),
                  titleStyle: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: AppColor.unselectedTextColor),
                  content: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      swimList[randomIndex],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: AppColor.unselectedTextColor),
                    ),
                  ),
                  actions: [
                    BottomButton(
                      buttonTitle: 'Ok',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: AppColor.selectedTextColor,
                      ),
                      onTap: () {
                        Get.back();
                      },
                      width: getProportionateScreenWidth(60),
                      height: getProportionateScreenHeight(60),
                      colour: AppColor.buttonbackgroundcolor,
                    ),
                  ],
                );
              },
              logo: Icons.pool,
              title: "Swimming",
            ),
          ],
        ),
      ),
    );
  }
}
