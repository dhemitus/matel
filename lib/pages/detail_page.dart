import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/managers/sql_manager.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/text_button.dart';
import 'package:flutter_mata_elang/model/profile.dart';
import 'package:flutter_mata_elang/pages/addnote_page.dart';

class DetailPage extends StatelessWidget {
  final Profile profile;

  DetailPage({Key key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getIt.get<SqlManager>().selectCase.execute(profile);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 25.0, right: 8.0),
        child: StreamBuilder<Profile>(
          stream: getIt.get<SqlManager>().selectCase,
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
                            Text(_profile.plate, style:Style.h6.copyWith(color: Style.oldred)),
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
                              child: Text(_profile.vehicle, style:Style.body2.copyWith(color: Style.oldred), textAlign: TextAlign.right,)
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
                              child: Text('${_profile.finance},\n${_profile.address}', style:Style.body2.copyWith(color: Style.oldred), textAlign: TextAlign.right,)
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
                              child: Text(_profile.name, style:Style.body2.copyWith(color: Style.oldred))
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Nomor Rangka', style:Style.button.copyWith(color: Style.slategrey)),
                            Text(_profile.frame, style:Style.body2.copyWith(color: Style.oldred)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Nomor Mesin', style:Style.button.copyWith(color: Style.slategrey)),
                            Text(_profile.engine, style:Style.body2.copyWith(color: Style.oldred)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('OVD', style:Style.button.copyWith(color: Style.slategrey)),
                            Text(_profile.ovd, style:Style.body2.copyWith(color: Style.oldred)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Saldo', style:Style.button.copyWith(color: Style.slategrey)),
                            Text(_profile.saldo, style:Style.body2.copyWith(color: Style.oldred)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Catatan Anda', style:Style.button.copyWith(color: Style.slategrey)),
                            Text(_profile.note, style:Style.body2.copyWith(color: Style.oldred)),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        text: Text('Bagikan\nData', textAlign: TextAlign.center, style: Style.button.copyWith(color:Style.oldred),),
                      ),
                      TextButton(
                        text: Text('Buat\nCatatan', textAlign: TextAlign.center, style: Style.button.copyWith(color:Style.oldred),),
                        onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddnotePage(profile: profile,)))
                      ),
                      TextButton(
                        text: Text('Laporkan\nData', textAlign: TextAlign.center, style: Style.button.copyWith(color:Style.oldred),),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}