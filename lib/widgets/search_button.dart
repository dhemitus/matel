import 'package:flutter/material.dart';
import 'package:flutter_mata_elang/style/style.dart';

class SearchButton extends StatelessWidget {

  final Function onPressed;
  final Widget icon;
  final String label;

  SearchButton({Key key, this.icon, this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(context),
      child: Container(
        padding: EdgeInsets.only(left: 20.0),
        alignment: Alignment.centerLeft,
        width: 48.0,
        height: 48.0,
        child: Row(
          children: <Widget>[
            icon,
            (label != null ? Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(label, style: Style.subTitle1.copyWith(color: Style.cloudyblue),),
              )
            :
            Container()
            )
          ],
        ),
      ),
    );
  }
}
