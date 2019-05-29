import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {

  final Function onPressed;
  final Widget text;

  TextButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(context),
      child: text,
    );
  }
}
