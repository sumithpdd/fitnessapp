import 'package:flutter/material.dart';

class SatefulWidgetCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomWidget();
  }
}

class _CustomWidget extends State<SatefulWidgetCustom> {
  var string = "";
  var _currencies = {"Taka", "Dollers", "Rupes", "Others"};
  var currentSelectedItem = "Taka";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (String str) {
              setState(() {
                string = str;
              });
            },
          ),
          DropdownButton<String>(
            items: _currencies.map((String currenciesItem) {
              return DropdownMenuItem<String>(
                value: currenciesItem,
                child: Text(currenciesItem),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                currentSelectedItem = value!;
              });
            },
            value: currentSelectedItem,
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Text("Your input is $string"),
          ),
        ],
      ),
    );
  }
}
