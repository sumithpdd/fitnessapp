import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    @required this.onTap,
    @required this.buttonTitle,
    @required this.colour,
    @required this.style,
    @required this.width,
    this.height,
    this.score,
    this.title,
  });

  final VoidCallback? onTap;
  final String? buttonTitle;
  final Color? colour;
  final TextStyle? style;
  final double? width;
  final double? height;
  final score;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
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
            color: colour),
        child: Center(
          child: Text(buttonTitle!, style: style),
        ),
        margin: EdgeInsets.only(top: 15.0, bottom: 15, right: 15, left: 15),
        width: width,
      ),
    );
  }
}
