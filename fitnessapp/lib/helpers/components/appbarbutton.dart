import 'package:fitnessapp/helpers/color/constants.dart';

import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  AppBarButton({@required this.icon, @required this.onPressed});
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: SizedBox(
          width: 50,
          child: IconButton(
            icon: Icon(
              icon,
              size: 25,
              color: AppColor.iconcolor.withOpacity(0.7),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
