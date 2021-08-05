import 'package:fitnessapp/common/strings.dart';
import 'package:fitnessapp/common/text_style.dart';
import 'package:fitnessapp/screen/languages.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double opacity;

  const CustomAppBar({this.opacity = 0.8});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: Row(
          children: <Widget>[
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: Strings.APP_NAME,
                  style: TextStyles.appNameTextStyle,
                ),
                TextSpan(
                  text: '\n',
                ),
                TextSpan(
                    text: Strings.TAG_LINE, style: TextStyles.tagLineTextStyle),
              ]),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LanguagesWidget()));
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
