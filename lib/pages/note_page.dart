import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/main_button.dart';
import 'package:flutter_mata_elang/widgets/menu_drawer.dart';
import 'package:flutter_mata_elang/widgets/note_list.dart';

class NotePage extends StatefulWidget {

  NotePage({Key key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
//              padding: EdgeInsets.symmetric(horizontal:6.0,),
              height: MediaQuery.of(context).size.height - 75,
              child: ListView(
                children: <Widget>[
                  NoteList(
                    code: '1000MJ',
                    name: 'PTVJ867655vvhg',
                    number: 'AJ000858',
                    desc: 'Mercedes hilang',
                    onPressed: (context) async {
                      print('ola');
                      final String currentTeam = await _asyncInputDialog(context);
                      print("Current team name is $currentTeam");
                    },
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _asyncInputDialog(BuildContext context) async {

  return showDialog (
    context: context,
    child: SimpleDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: <Widget>[
        SimpleDialogOption(
          
          child: Text('Hapus catatan', style: Style.button.copyWith(color: Style.red),),onPressed: (){Navigator.pop(context);},),
        SimpleDialogOption(
          child: Text('Tampilkan Data', style: Style.button.copyWith(color: Style.red),),onPressed: (){Navigator.pop(context);},),
        SimpleDialogOption(
          child: Text('Batal', style: Style.button.copyWith(color: Style.red),),onPressed: (){Navigator.pop(context);},),
      ]
    )
  );
}