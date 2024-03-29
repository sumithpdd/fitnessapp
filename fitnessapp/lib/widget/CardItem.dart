import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  final int? index;
  final bool? isSelected;
  final VoidCallback? onSelect;
  final String? headline;

  const CustomWidget({
    Key? key,
    @required this.index,
    @required this.isSelected,
    @required this.onSelect,
    @required this.headline,
  })  : assert(index != null),
        assert(isSelected != null),
        assert(onSelect != null),
        super(key: key);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelect,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100.0,
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color:
                    widget.isSelected! ? Color(0xffe1bee7) : Color(0xfff3e5f5),
                blurRadius: 20.0,
              ),
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: widget.isSelected!
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.purpleAccent, Colors.deepPurpleAccent])
                    : LinearGradient(colors: [Colors.white, Colors.white]),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.headline!,
                    style: TextStyle(
                      color: widget.isSelected! ? Colors.white : Colors.grey,
                      fontSize: 15.0,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
