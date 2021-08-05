import 'package:flutter/material.dart';

class SimpleUserInterface extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SimpleStateWidget();
  }
}

class SimpleStateWidget extends State<SimpleUserInterface> {
  var _currencies = ["Taka", "Rupes", "Doller"];
  var currentlySelectedItem = "";
  var displayResult = '';
  var _formKey = GlobalKey<FormState>();

  TextEditingController principalController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentlySelectedItem = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1!;

    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              getImageFromAsset(),
              Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    style: textStyle,
                    controller: principalController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter principal e.g 12000",
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                            color: Colors.yellowAccent, fontSize: 15.0),
                        labelText: "Principal",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: interestController,
                    decoration: InputDecoration(
                        hintText: "Rate of interest",
                        labelText: "Interest",
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                            color: Colors.yellowAccent, fontSize: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  )),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: termController,
                    decoration: InputDecoration(
                        hintText: "Term",
                        labelText: "Time in year",
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                            color: Colors.yellowAccent, fontSize: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  )),
                  Container(
                    width: 10.0,
                  ),
                  Expanded(
                      child: DropdownButton<String>(
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: currentlySelectedItem,
                    onChanged: (item) {
                      setState(() {
                        this.currentlySelectedItem = item!;
                      });
                    },
                  )),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                            "Calculate",
                            style: textStyle,
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                this.displayResult = _calculateTotalReturns();
                              }
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorLight,
                          child: Text(
                            "Reset",
                            style: textStyle,
                          ),
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          },
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  this.displayResult,
                  style: textStyle,
                ),
              )
            ],
          ),
        ));
  }

  getImageFromAsset() {
    AssetImage assetImage = AssetImage("images/admin.png");
    Image image = Image(image: assetImage);
    return Container(
      child: image,
      padding: EdgeInsets.all(20.0),
    );
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double interest = double.parse(interestController.text);
    double term = double.parse(termController.text);

    double totalPayable = principal + (principal * interest * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalPayable $currentlySelectedItem';

    return result;
  }

  void _reset() {
    principalController.text = '';
    interestController.text = '';
    termController.text = '';
    displayResult = '';
    currentlySelectedItem = _currencies[0];
  }
}
