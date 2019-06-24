import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/pages/profile_page.dart';
import 'package:flutter_mata_elang/pages/font_page.dart';
import 'package:flutter_mata_elang/widgets/menus/menu_drawer.dart';

class SettingPage extends StatelessWidget {

  SettingPage({Key key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
//    getIt.get<SqlManager>().selectCase.execute(profile);

    return Scaffold(
//      resizeToAvoidBottomPadding: false,
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
              child: MainButton(
                icon: STIcon.menu,
                onPressed: (context) => scaffoldKey.currentState.openDrawer()
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 73,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.folder_shared),
                    title: Text('Ubah Ukuran Font', style: Style.subTitle1.copyWith(color: Style.slategrey)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FontPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.cloud_download),
                    title: Text('Profil Saya', style: Style.subTitle1.copyWith(color: Style.slategrey)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProfilePage()));
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}