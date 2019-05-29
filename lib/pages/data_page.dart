import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/primary_button.dart';
import 'package:flutter_mata_elang/widgets/menus/menu_drawer.dart';

class DataPage extends StatefulWidget {

  DataPage({Key key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: MenuDrawer()
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0),
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
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal:20.0,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Kami telah melakukan update data pada Kamis, 07 Mei 2019 jam 19.00', style:Style.h6.copyWith(color: Style.red)),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0, right: 100.0, bottom: 10.0),
                    child: PrimaryButton(
                      label: 'Sinkron Data Anda', 
                      onPressed: (context) => print('data')
                    ),
                  ),
                  Text('Harap selalu update data anda agar mendapat data yang akurat dan up to date', style:Style.body2.copyWith(color: Style.slategrey)),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
