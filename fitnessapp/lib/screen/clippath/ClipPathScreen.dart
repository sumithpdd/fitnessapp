import 'package:flutter/material.dart';
import '../../utils/FunctinsData.dart';
import '../../widget/CardItem.dart';

class ClipPathScreen extends StatefulWidget {
  final _titles;

  ClipPathScreen(this._titles);

  @override
  _ClipPathScreenState createState() => _ClipPathScreenState(_titles);
}

class _ClipPathScreenState extends State<ClipPathScreen> {
  var _titles;
  late int currentSelectedIndex;

  _ClipPathScreenState(this._titles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: _titles.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return CustomWidget(
            index: index,
            isSelected: currentSelectedIndex == index,
            onSelect: () {
              setState(() {
                currentSelectedIndex = index;
                AppFunction.getclipPathDashboardPage(context, _titles[index]);
              });
            },
            headline: _titles[index],
          );
        },
      ),
    );
  }
}
