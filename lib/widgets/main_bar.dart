import 'package:flutter/material.dart';
import 'package:flutter_mata_elang/style/style.dart';

class MainBar extends StatelessWidget {
  final Color color;
  final Widget left;
  final Widget center;
  final Widget right;
  final MainAxisAlignment align;
  final bool shadow;
  final Offset direction;

  MainBar({Key key, this.color, this.left, this.center, this.right, this.align, this.shadow = false, this.direction = Style.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: align,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          (left != null) ? left : Container(),
          (center != null) ? center : Container(),
          (right != null) ? right :Container(),
        ],
      ),
      decoration: (shadow == true) ? BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 08.0,
            offset: direction
          )
        ]
      )
      :
      BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
      ),
    );
  }
}