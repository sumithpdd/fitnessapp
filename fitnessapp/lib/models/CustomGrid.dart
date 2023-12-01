import 'package:fitnessapp/screens/clippath/ClipPathScreen.dart';
import 'package:fitnessapp/utilities/FunctinsData.dart';
import 'package:flutter/material.dart';

class CustomGrid {
  String? title;
  String? subTitle;
  int? color1, color2;
  Widget? navigateScreen;

  CustomGrid(
      {this.title,
      this.subTitle,
      this.color1,
      this.color2,
      this.navigateScreen});

  static List<CustomGrid> widgetList() {
    List<CustomGrid> listOfWidget = [];

    listOfWidget.add(CustomGrid(
        title: 'Login', subTitle: 'login page ui', color1: 0xffdb1c76));
    listOfWidget.add(CustomGrid(
        title: 'Registration',
        subTitle: 'registration page ui',
        color1: 0xffe55149,
        color2: 0xfff47143));
    listOfWidget.add(CustomGrid(
        title: 'ClipPath',
        subTitle: 'clipPath page ui',
        color1: 0xff5663a4,
        color2: 0xff1c9cc7,
        navigateScreen: ClipPathScreen(AppFunction.clipPaths)));
    listOfWidget.add(CustomGrid(
        title: 'ListView',
        subTitle: 'list page ui',
        color1: 0xffccbb40,
        color2: 0xff73b74c));
    listOfWidget.add(CustomGrid(
        title: 'splash',
        subTitle: 'splash page ui',
        color1: 0xffd5b83f,
        color2: 0xfff37e43));
    listOfWidget.add(CustomGrid(
        title: 'button',
        subTitle: 'login page ui',
        color1: 0xff7554a7,
        color2: 0xff5d598c));
    // listOfWidget.add(CustomGrid(
    //     title: 'Theme',
    //     subTitle: 'theme page ui',
    //     color1: 0xffB06AB3,
    //     color2: 0xffB06AB3,
    //     navigateScreen: NavigationHomeScreen()));
    // listOfWidget.add(CustomGrid(
    //     title: 'Gridview',
    //     subTitle: 'grid page ui',
    //     color1: 0xff0575E6,
    //     color2: 0xff021B79,
    //     navigateScreen: GridScreen(AppFunction.gridview)));
    // listOfWidget.add(CustomGrid(
    //     title: 'Animation',
    //     subTitle: 'animation page ui',
    //     color1: 0xff34e89e,
    //     color2: 0xff0f3443,
    //     navigateScreen: AnimationScreen(AppFunction.animation)));

    return listOfWidget;
  }
}
