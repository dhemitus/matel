import 'package:flutter/material.dart';

class LineBar extends StatelessWidget {
  final Color color;
  final double thick;
  final double width;

  LineBar({Key key, this.color, this.thick, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: width,
      height: (thick == null ? 1.0 : thick),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
      )
    );
  }
}