import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/menus/menu_drawer.dart';
import 'package:flutter_mata_elang/widgets/buttons/secondary_button.dart';

class ServicePage extends StatefulWidget {

  ServicePage({Key key}) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

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
                  Text(
                    'Jika anda memiliki pertanyaan, kritik, saran atau ingin melakukan konfirmasi pembayaran silakan hubungi kami:\n\n1. Via SMS/Tlp: 082191443443\n\n2. Via Whatsapp: 082191443443',
                    style:Style.body2.copyWith(color: Style.slategrey)),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: SecondaryButton(
                      icon: STIcon.whatsApp,
                      label: '082191443443', 
                      onPressed: (context) => print('bill')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: SecondaryButton(
                      icon: STIcon.mail,
                      label: 'Via SMS', 
                      onPressed: (context) => print('bill')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: SecondaryButton(
                      icon: STIcon.phone,
                      label: 'Via Telepon', 
                      onPressed: (context) => print('bill')
                    ),
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
