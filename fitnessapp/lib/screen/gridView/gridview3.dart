import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GridViewThree extends StatefulWidget {
  @override
  _GridViewTwoState createState() => _GridViewTwoState();
}

class _GridViewTwoState extends State<GridViewThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview design'),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 3,
        children: <Widget>[
          gridItem("java developer", 'images/java.png', 0xffF7971E, 0xffFFD200),
          gridItem("android developer", 'images/android.png', 0xffe55149, 0xfff47143),
          gridItem("wordpress developer", 'images/java.png', 0xff5663a4, 0xff1c9cc7),
          gridItem("web developer", 'images/java.png', 0xffD66D75, 0xffE29587),
          gridItem("python developer", 'images/java.png', 0xff6190E8, 0xffA7BFE8),
          gridItem("laravel developer", 'images/java.png', 0xff44A08D, 0xff093637),
        ],
      ),
    );
  }

  Widget gridItem(String title, String image, int color1, int color2) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(color1), Color(color2)],
          begin: Alignment.centerLeft,
          end: Alignment(1.0, 1.0),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(child: Text('Job',style: TextStyle(color: Colors.white,fontSize: 16.0),),),
                    SizedBox(width: 10.0,),
                    Container(child: Icon(FontAwesomeIcons.compass,color: Colors.white,),),
                    SizedBox(width: 10.0,),
                    Container(child: Text('Guide',style: TextStyle(color: Colors.white,fontSize: 16.0),),),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Text(title,style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
    );
  }
}
