
import 'dart:math';

import 'package:flutter/material.dart';

class CustomWidgets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        color: Colors.lightBlueAccent,
        alignment: Alignment.center,
            child:Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                        "Mamun",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: "customFont",
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic
                        )
                    )),

                    Expanded(child: Text(
                        "Hossain",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: "customFont",
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic
                        )
                    )),

                  ],

                ),

                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                        "Shakibul",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: "customFont",
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic
                        )
                    )),

                    Expanded(child: Text(
                        "Bashar",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: "customFont",
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic
                        )
                    )),

                  ],

                ),

                ImageLoader(),
                RiseGoButton(),
              ],
            )
      )
    );
  }

  int generateLuckyNumber(){

    var random = Random();
    int number = random.nextInt(10);
    return number;

  }

}

class ImageLoader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage("images/admin.png");
    Image image = Image(image: assetImage);
    return Container(child: image,padding: EdgeInsets.only(top:20.0),);
  }


}

class RiseGoButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      child: RaisedButton(
        onPressed: (){
          showAlertDialog(context);
        },
        color: Colors.deepOrange,
        elevation: 6.0,
        child: Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "customFont",
              fontWeight: FontWeight.w700,

            ),
        ),
      ),

    );
  }

  showAlertDialog(BuildContext context){

    var alertDialog  = AlertDialog(
      title: Text("This is very good day"),
      content: Text("Have a nice day!"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );

  }

}