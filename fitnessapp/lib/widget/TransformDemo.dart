import 'package:flutter/material.dart';

class TransformDemo extends StatefulWidget {
  @override
  _TransformDemoState createState() => _TransformDemoState();
}

class _TransformDemoState extends State<TransformDemo> {
  double slideVal = 0;

  @override
  void initState() {
    super.initState();
    slideVal = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        slider(),
        rotate(),
        scale(),
        traslate(),
        skew()
      ],
    );
  }

  Container rotate(){
    return Container(
      child: Transform.rotate(
        angle: slideVal,
        origin: Offset(0.0,0.0),
        child: Container(
          height: 50.0,
          width: 50.0,
          color: Colors.red,
        ),
      ),
    );
  }

  Container traslate(){
    return Container(
      child: Transform.translate(
        offset: Offset(slideVal, 0.0),
        child: Container(
          height: 50.0,
          width: 50.0,
          color: Colors.green,
        ),
      ),
    );
  }

  Container skew(){
    return Container(
      child: Transform(
       transform: Matrix4.skewX(slideVal/100),
        child: Container(
          height: 50.0,
          width: 50.0,
          color: Colors.green,
        ),
      ),
    );
  }


  Container scale(){
    return Container(
      child: Transform.scale(
        scale: slideVal == 0 ? 1 : slideVal/50,
        origin: Offset(0.0,0.0),
        child: Container(
          height: 50.0,
          width: 50.0,
          color: Colors.red,
        ),
      ),
    );
  }

  Slider slider() {
    return Slider(
      value: slideVal,
      min: 0,
      max: 100,
      onChanged: (val) {
        setState(() {
          slideVal = val;
        });
      },
    );
  }
}
