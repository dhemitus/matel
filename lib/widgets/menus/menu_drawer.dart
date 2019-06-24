import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/pages/setting_page.dart';
import 'package:flutter_mata_elang/pages/signout_page.dart';
import 'package:flutter_mata_elang/pages/data_page.dart';
import 'package:flutter_mata_elang/pages/note_page.dart';
import 'package:flutter_mata_elang/pages/search_page.dart';
import 'package:flutter_mata_elang/pages/bulks_page.dart';
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
                  child: Image.asset('assets/images/matel.png'),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text('Pencarian', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.folder_shared),
          title: Text('Data Saya', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BulksPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.cloud_download),
          title: Text('Update Data', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => DataPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.event_note),
          title: Text('Catatan', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NotePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.settings_applications),
          title: Text('Pengaturan', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SettingPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_phone),
          title: Text('Kontak SK', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BillingPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text('Hubungi Admin', style: Style.subTitle1.copyWith(color: Style.slategrey)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ServicePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Style.lightred,),
          title: Text('Logout', style: Style.subTitle1.copyWith(color: Style.lightred)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SignOutPage()));
          },
        )
      ]
    );
  }
}
