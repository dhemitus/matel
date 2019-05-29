import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';

class SecondaryButton extends StatelessWidget {

  final String label;
  final Widget icon;
  final Function onPressed;

  SecondaryButton({Key key, this.label, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:14.0),
      child: InkWell(
        onTap: () => onPressed(context),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: (icon != null) ? icon :Container(),
              ),
              Text(label, style: Style.subTitle1.copyWith(color: Style.slategrey,)),
            ],
          ),
          height: 50.0,
          decoration: BoxDecoration(
            color: Style.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: <BoxShadow> [
              new BoxShadow(
                  color: Style.oldred.withOpacity(0.3),
                  blurRadius: 08.0,
                  offset: new Offset(0.0, 03.0)
              )
            ]
          ),
        ),
      ),
    );
  }
}
