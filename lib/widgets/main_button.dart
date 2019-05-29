import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {

  final Function onPressed;
  final Widget icon;

  MainButton({Key key, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(context),
      child: Container(
        alignment: Alignment.center,
        width: 48.0,
        height: 48.0,
        child: icon,
      ),
    );
  }
}
