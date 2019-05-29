import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/line_bar.dart';

class SearchList extends StatelessWidget {

  final Function onPressed;
  final String code;
  final String name;
  final String desc;

  SearchList({Key key, this.code, this.name, this.desc, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => onPressed(context),
        leading: Text(code, style:Style.subTitle1.copyWith(color: Style.red)),
        title: Row(
          children: <Widget> [
            Text('${name.length > 20 ? name.substring(0, 20) : name}...', style:Style.body2.copyWith(color: Style.oldred)),
          ]
        ),
        subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text(desc, style:Style.body2.copyWith(color: Style.darkindigo)),
          LineBar(
            width: MediaQuery.of(context).size.width - 40.0,
            color: Style.cloudyblue
          )
        ]
      ),
    );
  }
}
