import 'package:fitnessapp/helpers/color/constants.dart';
import 'package:fitnessapp/helpers/components/appbarbutton.dart';
import 'package:fitnessapp/helpers/components/widget/bottom_button.dart';
import 'package:fitnessapp/helpers/components/custom_appbar.dart';
import 'package:fitnessapp/helpers/config/size_config.dart';
import 'package:fitnessapp/models/user_data.dart';
import 'package:fitnessapp/screens/home/widget/gendercard.dart';
import 'package:fitnessapp/screens/home/widget/reusable_card.dart';
import 'package:fitnessapp/helpers/components/widget/round_icon_button.dart';
import 'package:fitnessapp/models/calculate_bmi.dart';
import 'package:fitnessapp/screens/profile/profile.dart';
import 'package:fitnessapp/screens/result/result_screen.dart';
import 'package:fitnessapp/screens/tips/tipsscreen.dart';
import 'package:fitnessapp/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BmiDashboard extends StatefulWidget {
  @override
  BmiDashboardState createState() => BmiDashboardState();
}

class BmiDashboardState extends State<BmiDashboard> {
  // InterstialAd interstialAd = new InterstialAd();
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);

    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        onpressed: () {
          print("pressed");
          // interstialAd.createInterad();
          // interstialAd.showInterad();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(),
            ),
          );
        },
        backgroundcolor: Colors.transparent,
        title: 'BMI Calculator',
        leading: AppBarButton(
          icon: Icons.lightbulb,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TipsScreen(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: GenderCard(),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: AppColor.backgroundcolor,
                        onPress: () => {},
                        cardChild: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: getProportionateScreenHeight(10.0),
                              ),
                              Text(
                                'Height',
                                style: TextStyle(
                                  color: AppColor.unselectedTextColor,
                                  fontSize: getProportionateScreenHeight(23.0),
                                ),
                              ),

                              //for slider
                              Container(
                                height: getProportionateScreenHeight(480),
                                child: SfSlider.vertical(
                                  value: userData.height.toDouble(),
                                  min: 0.0,
                                  max: 220,
                                  interval: 20,
                                  showTicks: true,
                                  showLabels: true,
                                  activeColor: AppColor.buttonbackgroundcolor,
                                  inactiveColor: AppColor.unselectedTextColor
                                      .withOpacity(0.2),
                                  overlayShape: SfOverlayShape(),
                                  thumbShape: SfThumbShape(),
                                  labelPlacement: LabelPlacement.betweenTicks,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 3,
                                  onChanged: (dynamic newValue) {
                                    setState(() {
                                      userData.height = newValue.round();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ReusableCard(
                            colour: AppColor.backgroundcolor,
                            cardChild: Container(
                              height: getProportionateScreenHeight(240.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: getProportionateScreenHeight(10.0),
                                  ),
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                      color: AppColor.unselectedTextColor,
                                      fontSize:
                                          getProportionateScreenHeight(23.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(25.0),
                                  ),
                                  Text(
                                    userData.weight.toString(),
                                    style: TextStyle(
                                      color: AppColor.unselectedTextColor,
                                      fontSize:
                                          getProportionateScreenHeight(60),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(25.0),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () {
                                          setState(() {
                                            userData.weight--;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width:
                                            getProportionateScreenWidth(15.0),
                                      ),
                                      RoundIconButton(
                                          icon: FontAwesomeIcons.plus,
                                          onPressed: () {
                                            setState(() {
                                              userData.weight++;
                                            });
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ReusableCard(
                            colour: AppColor.backgroundcolor,
                            cardChild: Container(
                              height: getProportionateScreenHeight(240.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: getProportionateScreenHeight(10.0),
                                  ),
                                  Text(
                                    'Age',
                                    style: TextStyle(
                                      color: AppColor.unselectedTextColor,
                                      fontSize:
                                          getProportionateScreenHeight(23.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(25.0),
                                  ),
                                  Text(
                                    userData.age.toString(),
                                    style: TextStyle(
                                      color: AppColor.unselectedTextColor,
                                      fontSize:
                                          getProportionateScreenHeight(60),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(25.0),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () {
                                          setState(
                                            () {
                                              userData.age--;
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width:
                                            getProportionateScreenWidth(15.0),
                                      ),
                                      RoundIconButton(
                                          icon: FontAwesomeIcons.plus,
                                          onPressed: () {
                                            setState(() {
                                              userData.age++;
                                            });
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: BottomButton(
                  buttonTitle: 'Let\'s Begin ',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    color: AppColor.backgroundcolor,
                  ),
                  onTap: () {
                    // interstialAd.createInterad();
                    // interstialAd.showInterad();

                    BmiLogic calc = BmiLogic(
                        height: userData.height,
                        weight: userData.weight,
                        age: userData.age);
                    userData.bmi = calc.calculateBMI;
                    userData.bmicategory = calc.getResult;
                    userData.bmifatpercentage = calc.calculateBMIFatPErcentage;
                    Provider.of<DatabaseService>(context, listen: false)
                        .saveUserMeasurements(userData);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI,
                          resultText: calc.getResult,
                        ),
                      ),
                    );
                  },
                  width: getProportionateScreenWidth(812),
                  colour: AppColor.buttonbackgroundcolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
