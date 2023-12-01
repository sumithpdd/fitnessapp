import 'package:fitnessapp/helpers/color/constants.dart';
import 'package:fitnessapp/helpers/config/size_config.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundcolor;
  final Widget? leading;
  final VoidCallback? onpressed;

  const CustomAppBar({
    Key? key,
    this.title,
    this.backgroundcolor,
    this.leading,
    @required this.onpressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30, left: 30, top: 5),
      child: AppBar(
        backgroundColor: backgroundcolor,
        centerTitle: true,
        title: Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColor.titleTextColor,
              fontSize: getProportionateScreenWidth(20),
              fontStyle: FontStyle.normal),
        ),
        leading: leading,
        elevation: 0,
        actions: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: SizedBox(
              width: 50,
              child: IconButton(
                icon: Icon(
                  Icons.person_outline,
                  size: 25,
                  color: AppColor.iconcolor.withOpacity(0.7),
                ),
                onPressed: onpressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
