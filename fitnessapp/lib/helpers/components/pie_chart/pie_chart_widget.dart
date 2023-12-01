import 'package:fitnessapp/helpers/color/constants.dart';
import 'package:fitnessapp/helpers/components/pie_chart/pie_chart_paint.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final total;
  final used;
  final String? text;
  const PieChartWidget(
      {@required this.total,
      @required this.used,
      @required this.text,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double free = total - used;
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.43,
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            decoration: BoxDecoration(
              color: AppColor.backgroundcolor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 17,
                  offset: Offset(-5, -5),
                  color: Color.fromRGBO(239, 239, 239, 1),
                ),
                BoxShadow(
                  spreadRadius: -2,
                  blurRadius: 10,
                  offset: Offset(7, 7),
                  color: Color.fromRGBO(206, 220, 226, 1),
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.6,
                    child: CustomPaint(
                      child: Center(
                        child: Text(
                          text!,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.2,
                            // fontSize: 50,
                          ),
                        ),
                      ),
                      foregroundPainter: PieChartPaint(
                        used,
                        free,
                        constraints.maxWidth * 0.11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
