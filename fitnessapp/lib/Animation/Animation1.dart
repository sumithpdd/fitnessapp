import 'package:flutter/material.dart';

class AnimOne extends StatefulWidget {
  @override
  _AnimOneState createState() => _AnimOneState();
}

class _AnimOneState extends State<AnimOne> with SingleTickerProviderStateMixin {
  AnimationController? animController;
  Animation? animation;

  @override
  void initState() {
    super.initState();

    animController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: -0.15)
        .animate(CurvedAnimation(parent: animController!, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animController!,
      builder: (context, child) {
        return Center(
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 350.0,
                    height: 200.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Buy'),
                          elevation: 7.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        RaisedButton(
                          child: Text('Details'),
                          elevation: 7.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 350.0,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage('images/hotel/hotel_4.png'),
                        ),
                      ),
                      transform: Matrix4.translationValues(
                          0.0, animation!.value * width, 0.0),
                    ),
                    onTap: () {
                      animController!.forward();
                    },
                    onDoubleTap: () {
                      animController!.reverse();
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
