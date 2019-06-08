import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/line_bar.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class NoteList extends StatelessWidget {

  final Function onPressed;
  final Profile profile;

  NoteList({Key key, this.profile, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onPressed(context),
        leading: Text(profile.plate, style:Style.subTitle1.copyWith(color: Style.red)),
      title: Row(
        children: <Widget> [
          Text(profile.frame, style:Style.button.copyWith(color: Style.oldred)),
          Text(' | ', style:Style.body2.copyWith(color: Style.darkindigo)),
          Text(profile.engine, style:Style.button.copyWith(color: Style.oldred)),
        ]
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text(profile.note, style:Style.body2.copyWith(color: Style.darkindigo)),
          LineBar(
            width: MediaQuery.of(context).size.width - 40.0,
            color: Style.cloudyblue
          )
        ]
      ),
    );
  }
}
