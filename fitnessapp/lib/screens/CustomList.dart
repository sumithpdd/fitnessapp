import 'package:flutter/material.dart';

class CustomList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(

      children: <Widget>[

        ListTile(
          leading: Icon(Icons.landscape),
          title: Text("Bangladesh"),
          subtitle: Text("Very beautiful country"),
          trailing: Icon(Icons.wb_sunny),
          onTap: (){
            debugPrint("Bangladesh");
          },
        ),
        ListTile(
          leading: Icon(Icons.wifi),
          title: Text("Tenda Black"),
          subtitle: Text("Great quality"),
          onTap: (){
            debugPrint("Tanda");
          },
        ),
        ListTile(
          leading: Icon(Icons.wifi),
          title: Text("Black Panther"),
          subtitle: Text("Great movie"),
          onTap: (){
            debugPrint("Panther");
          },
        ),

      ],

    );
  }


}