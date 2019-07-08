import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {

  final Function onPressed;
  final Widget text;
  final Widget icon;

  TextIconButton({Key key, this.text, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(context),
      child: Column(
        children: <Widget>[
          icon,
          text,
        ],
      ),
    );
  }
}
