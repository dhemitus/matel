import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';

class PrimaryButton extends StatelessWidget {

  final String label;
  final Function onPressed;
  final bool disabled;

  PrimaryButton({Key key, this.label, this.onPressed, this.disabled = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => disabled ? print('') :  onPressed(context),
      child: Container(
        alignment: Alignment.center,
        child: Text(label, style: Style.subTitle1,),
        height: 50.0,
        decoration: BoxDecoration(
          color: disabled ? Style.palered: Style.oldred,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          gradient: new LinearGradient(
            colors: disabled ? [Style.lightred, Style.palered] : [Style.mediumred, Style.oldred],
            begin: Alignment.centerRight,
            end: new Alignment(-1.0, -1.0)
          ),
          boxShadow: <BoxShadow> [
            new BoxShadow(
                color: disabled ? Style.palered: Style.oldred,
                blurRadius: 03.0,
                offset: new Offset(0.0, 05.0)
            )
          ]
        ),
      ),
    );
  }
}
