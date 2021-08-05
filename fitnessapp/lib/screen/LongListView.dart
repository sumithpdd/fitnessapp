import 'package:flutter/material.dart';

class LongList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var items = getListData();

    return ListView.builder(itemBuilder: (context,index){

      return ListTile(
        leading: Icon(Icons.access_time),
        title: Text(items[index]),
        onTap: (){

          showSnackBar(context, items[index]);

        },
      );
    }
    );
  }

  showSnackBar(BuildContext context,String title){

    var snackbar = SnackBar(
      content: Text(title),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  List<String> getListData(){
    var items = List<String>.generate(1000, (counter) => "Item $counter");
    return items;
  }

}