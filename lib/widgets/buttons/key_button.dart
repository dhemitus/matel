import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';

class KeyButton extends StatelessWidget {

  final Function onPressed;
  final Widget child;
  final double width;
  final double height;

  KeyButton({Key key, this.height, this.width, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(context),
      child: Container(
        padding: EdgeInsets.all(4.0),
        alignment: Alignment.center,
        height: height,
        width: width,
        child: Container(
          height: height - 8.0,
          width: width - 8.0,
          alignment: Alignment.center,
          child: child,
          decoration: BoxDecoration(
            color: Style.verygreylight,
            shape: BoxShape.rectangle,
            border: Border.all(
              width: 1.0,
              color: Style.greylight
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(4.0)
            ),
            boxShadow: <BoxShadow> [
              new BoxShadow(
                  color: Style.greylight,
                  blurRadius: 08.0,
                  offset: new Offset(0.0, 03.0)
              )
            ]
          )
        ),
      ),
    );
  }
}
