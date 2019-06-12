import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/menus/menu_drawer.dart';
import 'package:flutter_mata_elang/widgets/keyboard/keyboard.dart';
import 'package:flutter_mata_elang/widgets/lists/search_list.dart';
import 'package:flutter_mata_elang/pages/detail_page.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/managers/sql_manager.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class SearchPage extends StatefulWidget {

  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  String _text = '';

  onPressed(KeyboardKey key) {
    print(key);
    if( key.type == KeyType.text) {
      _text = _text + key.key.toUpperCase();
    } else if(key.type == KeyType.symbol) {
      switch(key.action){
        case KeyAction.backspace:
          _text = _text.substring(0, _text.length - 1);
          break;
        case KeyAction.delete:
          _text = '';
          break;
        default:
      }
    }

    getIt.get<SqlManager>().searchQuery.execute(_text);
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
              child: StreamBuilder<List<dynamic>> (
                stream: getIt.get<SqlManager>().searchCases,
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                  if(snapshot.hasData && snapshot.data.length > 0) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Profile _item = Profile.fromMap(snapshot.data[index]);
                        return SearchList(
                          profile:_item,
                          onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailPage(profile: _item,)))
                        );
                      },
                    );
                  } else {
                    return Text('kosong');
                  }
                },
              )
            ),
            Container(
              color: Style.white,
              child: SpecialKeyboard(
                height: 300,
                onPressed: onPressed,
              )
            )
          ],
        ),
      ),
    );
  }
}