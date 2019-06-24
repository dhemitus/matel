import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/managers/blk_manager.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/text_button.dart';
import 'package:flutter_mata_elang/model/profile.dart';
import 'package:flutter_mata_elang/pages/addnote_page.dart';

class BulkPage extends StatelessWidget {
  final Profile profile;

  BulkPage({Key key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getIt.get<BlkManager>().selectBulk.execute(profile);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 25.0, right: 8.0),
        child: StreamBuilder<Profile>(
          stream: getIt.get<BlkManager>().selectBulk,
          builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
            Profile _profile = profile;

            if(snapshot.hasData) {
              _profile = snapshot.data;
            }
            return Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width - 58.0,
                  height: 48.0,
                  child: MainButton(
                    icon: STIcon.arrowLeft,
                      onPressed: (context) => Navigator.pop(context)
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:10.0,),
                  height: MediaQuery.of(context).size.height - 119,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Nomor Polisi', style:Style.button.copyWith(color: Style.slategrey)),
                            Text((_profile.plate.isEmpty) ? ' ' : _profile.plate, style:Style.h6.copyWith(color: Style.oldred)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Jenis/Merk', style:Style.button.copyWith(color: Style.slategrey)),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text((_profile.vehicle.isEmpty) ? ' ' : _profile.vehicle, style:Style.body2.copyWith(color: Style.oldred), textAlign: TextAlign.right,)
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Finance/Leasing', style:Style.button.copyWith(color: Style.slategrey)),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text('${_profile.name.isEmpty ? ' ' : _profile.name},\n${_profile.phone.isEmpty ? ' ' : _profile.phone}', style:Style.body2.copyWith(color: Style.oldred), textAlign: TextAlign.right,)
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Nama Debitur', style:Style.button.copyWith(color: Style.slategrey)),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(_profile.name.isEmpty ? ' ' : _profile.name, style:Style.body2.copyWith(color: Style.oldred))
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Catatan Anda', style:Style.button.copyWith(color: Style.slategrey)),
                            Text(_profile.note.isEmpty ? ' ' : _profile.note, style:Style.body2.copyWith(color: Style.oldred)),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}