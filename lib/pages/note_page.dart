import 'package:flutter/material.dart';
import 'package:flutter_mata_elang/pages/detail_page.dart';

import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/menus/menu_drawer.dart';
import 'package:flutter_mata_elang/widgets/lists/note_list.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/managers/sql_manager.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class NotePage extends StatefulWidget {

  NotePage({Key key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  Profile profile;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    getIt.get<SqlManager>().searchNotes.execute();

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: MenuDrawer()
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 48.0,
              child: MainButton(
                icon: STIcon.menu,
                onPressed: (context) => scaffoldKey.currentState.openDrawer()
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 75,
              child: StreamBuilder<List<dynamic>>(
                stream: getIt.get<SqlManager>().searchNotes,
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if(snapshot.hasData && snapshot.data.length > 0) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Profile _item = Profile.fromMap(snapshot.data[index]);
                        return NoteList(
                          profile:_item,
                          onPressed: (context) async {
                            print('ola');
                            profile = _item;
                            await _asyncInputDialog(context, _item);
                          },
                        );
                      },
                    );
                  } else {
                    return Text('kosong');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _asyncInputDialog(BuildContext context, Profile profile) async {

  return showDialog (
    context: context,
    child: SimpleDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: <Widget>[
        SimpleDialogOption(
          child: Text(
            'Hapus catatan', 
            style: Style.button.copyWith(color: Style.red),
            ),
            onPressed: (){
              profile.note = '';
              getIt.get<SqlManager>().deleteNote.execute(profile);
              Navigator.pop(context);
            },
        ),
        SimpleDialogOption(
          child: Text('Tampilkan Data', style: Style.button.copyWith(color: Style.red),),
            onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailPage(profile: profile,)));
            },
        ),
        SimpleDialogOption(
          child: Text('Batal', style: Style.button.copyWith(color: Style.red),),onPressed: (){Navigator.pop(context);},),
      ]
    )
  );
}