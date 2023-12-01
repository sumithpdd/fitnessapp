import 'package:fitnessapp/helpers/color/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 8,
      child: Icon(
        icon,
        color: AppColor.unselectedTextColor.withOpacity(0.7),
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: AppColor.backgroundcolor,
    );
  }
}
