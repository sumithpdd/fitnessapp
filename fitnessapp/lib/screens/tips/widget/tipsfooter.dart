import 'package:fitnessapp/helpers/color/constants.dart';
import 'package:fitnessapp/helpers/config/size_config.dart';
import 'package:flutter/material.dart';

class FooterTipsWidget extends StatelessWidget {
  final IconData logo;
  final String title;
  final VoidCallback ontap;

  FooterTipsWidget(
      {required this.logo, required this.title, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color:
                              AppColor.unselectedTextColor.withOpacity(0.08)),
                      child: Icon(
                        logo,
                        size: 30,
                        color: AppColor.unselectedTextColor.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18.0),
                              color:
                                  AppColor.unselectedTextColor.withOpacity(0.7),
                              height: 1.25,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  child: IconButton(
                      color: AppColor.iconcolor.withOpacity(0.7),
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
