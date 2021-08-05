import 'package:flutter/material.dart';

class WaveHeaderOne extends StatefulWidget {
  @override
  _WaveHeaderState createState() => _WaveHeaderState();
}

class _WaveHeaderState extends State<WaveHeaderOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff622f74),
                  gradient: LinearGradient(
                    colors:[Color(0xff2159db),Color(0xff753fe4)],
                    begin: Alignment.centerRight,
                    end: Alignment(-1.0, -1.0),
                  )
              ),
            ),
            Column(
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(top:32.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80.0,
                    child: Image.asset('images/profile.png',height: 120.0,width: 120.0,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Mamun Hossain',style: TextStyle(color: Colors.white,fontSize: 24.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text('Dhaka,Bangladesh',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                ),
              ],
            )
          ],
        ),
        clipper: HeaderColor(),
      ),
    );
  }
}

class HeaderColor extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 280.0);
    path.lineTo(size.width, size.height - 350.0);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;


}
