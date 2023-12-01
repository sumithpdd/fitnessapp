import 'package:fitnessapp/helpers/color/constants.dart';
import 'package:fitnessapp/helpers/components/pie_chart/pie_chart_widget.dart';
import 'package:fitnessapp/helpers/config/size_config.dart';

import 'package:flutter/material.dart';

class TipsHeader extends StatelessWidget {
  TipsHeader({
    this.bmiResult,
  });

  final double? bmiResult;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: AppColor.backgroundcolor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            spreadRadius: -50,
            blurRadius: 17,
            offset: Offset(-5, -5),
            color: Color.fromRGBO(239, 239, 239, 1),
          ),
          BoxShadow(
            spreadRadius: -2,
            blurRadius: 10,
            offset: Offset(7, 7),
            color: Color.fromRGBO(206, 220, 226, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: getProportionateScreenHeight(80.0),
                width: getProportionateScreenWidth(100.0),
                child: PieChartWidget(
                  text: '',
                  total: 30.0,
                  used: 30.0,
                ),
              ),
            ],
          ),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Vin!",
                style: TextStyle(
                  color: AppColor.unselectedTextColor.withOpacity(0.9),
                  fontSize: getProportionateScreenWidth(25),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Container(
                  width: getProportionateScreenWidth(170),
                  child: Text(
                    "I'm your mentor to give to good tips.",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: AppColor.unselectedTextColor.withOpacity(0.7),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
