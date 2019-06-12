import 'package:flutter/material.dart';

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
        alignment: Alignment.center,
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
