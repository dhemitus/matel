import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/main_button.dart';
import 'package:flutter_mata_elang/widgets/menu_drawer.dart';
import 'package:flutter_mata_elang/widgets/search_list.dart';
import 'package:flutter_mata_elang/pages/detail_page.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

class SearchPage extends StatefulWidget {

  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  String _text = '';

  _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      _text = _text + key.capsText;
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (_text.length == 0) return;
          _text = _text.substring(0, _text.length - 1);
          break;
        case VirtualKeyboardKeyAction.Space:
          _text = _text + key.text;
          break;
        default:
      }
    }
    setState(() {});
  }

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
            Row(
              children: <Widget>[
                MainButton(
                  icon: STIcon.menu,
                  onPressed: (context) => scaffoldKey.currentState.openDrawer()
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 8.0),
                  width: MediaQuery.of(context).size.width - 58.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: Style.greylight,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(_text, style: Style.h6.copyWith(color: Style.darkindigo),),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 375,
              child: ListView(
                children: <Widget>[
                  SearchList(
                    code: 'B6339FFN',
                    name: 'Mercedes',
                    desc: 'Mitsui 8',
                    onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailPage()))
                  ),
                  SearchList(
                    code: 'B1010TOT',
                    name: 'Toyota Kijang Inova 2.0G A/T 2005',
                    desc: 'Clipan Nas 5',
                    onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailPage()))
                  ),
                  SearchList(
                    code: 'D1337ROT',
                    name: 'Toyota Kijang Inova 2.0G A/T 2005',
                    desc: 'Clipan Nas 5',
                    onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailPage()))
                  ),
                  SearchList(
                    code: 'L123RA',
                    name: 'Toyota VVTI G 1.3 M/T 2008',
                    desc: 'MNC Nas 5',
                    onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailPage()))
                  ),
                  SearchList(
                    code: 'B6339FFN',
                    name: 'Nissan Livina 1.5 (4x2) M/T Merah metalik TH 2000',
                    desc: 'Andalas Nas 4',
                    onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailPage()))
                  ),
                  SearchList(
                    code: '1003NMA',
                    name: 'E2 LV 2.5 FF G M/T',
                    desc: 'OTO WO Nas 4',
                    onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailPage()))
                  ),
                ]
              ),
            ),
            Container(
              color: Style.white,
              child: VirtualKeyboard(
                  height: 300,
                  textColor: Style.oldred,
                  type: VirtualKeyboardType.Alphanumeric,
                  onKeyPress: _onKeyPress),
            )
          ],
        ),
      ),
    );
  }
}