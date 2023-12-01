import 'package:fitnessapp/models/CustomGrid.dart';
import 'package:flutter/material.dart';

class GridOne extends StatelessWidget {
  final List<CustomGrid>? allWidgets;

  GridOne({Key? key, this.allWidgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 0.9,
      children: _gridViewItems(context),
    );
  }

  _gridViewItems(BuildContext context) {
    List<Widget> widgets = [];

    for (int i = 0; i < allWidgets!.length; i++) {
      var widget = _getGridItemUI(context, allWidgets![i]);
      widgets.add(widget);
    }
    return widgets;
  }

  _getGridItemUI(BuildContext context, CustomGrid grid) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => grid.navigateScreen!,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(grid.color1!), Color(grid.color2!)],
                  begin: Alignment.centerRight,
                  end: Alignment(-1.0, -1.0))),
          child: Text(
            grid.title!,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
