import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GridViewTwo extends StatefulWidget {
  @override
  _GridViewTwoState createState() => _GridViewTwoState();
}

class _GridViewTwoState extends State<GridViewTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview design'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
        children: <Widget>[
          gridItem("java developer", 'images/java.png', 0xffF7971E, 0xffFFD200),
          gridItem("android developer", 'images/android.png', 0xffe55149, 0xfff47143),
          gridItem("wordpress developer", 'images/profile.png', 0xff5663a4, 0xff1c9cc7),
          gridItem("web developer", 'images/profile.png', 0xffD66D75, 0xffE29587),
          gridItem("python developer", 'images/profile.png', 0xff6190E8, 0xffA7BFE8),
          gridItem("laravel developer", 'images/profile.png', 0xff44A08D, 0xff093637),
        ],
      ),
    );
  }

  Widget gridItem(String title, String image, int color1, int color2) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
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
                  borderRadius: BorderRadius.circular(24.0),
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
                    Container(child: Text('Job',style: TextStyle(color: Colors.white,fontSize: 15.0),),),
                    SizedBox(width: 10.0,),
                    Container(child: Icon(FontAwesomeIcons.compass,color: Colors.white,),),
                    SizedBox(width: 10.0,),
                    Container(child: Text('Guide',style: TextStyle(color: Colors.white,fontSize: 15.0),),),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Text(title,maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
    );
  }
}
