import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.textcolor,
      @required this.colour,
      this.cardChild,
      this.onPress,
      this.result,
      this.resultText,
      this.title});

  final TextDecoration? textcolor;
  final Color? colour;
  final Widget? cardChild;
  final VoidCallback? onPress;
  final String? title;
  final String? result;
  final String? resultText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.only(bottom: 15, top: 15, left: 15, right: 15),
        decoration: BoxDecoration(
          color: colour,
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
      ),
    );
  }
}
