import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/pages/setting_page.dart';
import 'package:flutter_mata_elang/pages/signout_page.dart';
import 'package:flutter_mata_elang/pages/data_page.dart';
import 'package:flutter_mata_elang/pages/note_page.dart';
import 'package:flutter_mata_elang/pages/billing_page.dart';
import 'package:flutter_mata_elang/pages/service_page.dart';

class MenuDrawer extends StatelessWidget {

  final Function onPressed;
  final Widget icon;

  MenuDrawer({Key key, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 120.0,
//                child: STIcon.logo
                  child: Image.asset('assets/images/matel.png'),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text('Update Data', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DataPage()));
          },
        ),
        ListTile(
          title: Text('Catatan', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NotePage()));
          },
        ),
        ListTile(
          title: Text('Setting', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SettingPage()));
          },
        ),
        ListTile(
          title: Text('Billing', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BillingPage()));
          },
        ),
        ListTile(
          title: Text('Customer Service', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ServicePage()));
          },
        ),
        ListTile(
          title: Text('Logout', style: Style.subTitle1.copyWith(color: Style.lightred)),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignOutPage()));
          },
        )
      ]
    );
  }
}
