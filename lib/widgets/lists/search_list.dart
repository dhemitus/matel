import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/line_bar.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class SearchList extends StatelessWidget {

  final Function onPressed;
  final Profile profile;

  SearchList({Key key, this.profile, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => onPressed(context),
        leading: Text(profile.plate, style:Style.subTitle1.copyWith(color: Style.oldred)),
        title: Text('${profile.finance} ${profile.phone} ${profile.number} ${profile.saldo}', style:Style.body2.copyWith(color: Style.darkindigo)),
        subtitle: Text(profile.vehicle, style:Style.caption.copyWith(color: Style.oldred)),
/*        Row(
          children: <Widget> [
            Text('${profile.name.length > 20 ? profile.name.substring(0, 20) : profile.name}...', style:Style.body2.copyWith(color: Style.oldred)),
          ]
        ),*/
/*        subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text('${profile.finance}, ${profile.address}', style:Style.body2.copyWith(color: Style.darkindigo)),
          LineBar(
            width: MediaQuery.of(context).size.width - 40.0,
            color: Style.cloudyblue
          )
        ]
        ),*/
    );
  }
}
