import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/primary_button.dart';
import 'package:flutter_mata_elang/pages/signin_page.dart';
import 'package:flutter_mata_elang/widgets/menus/menu_drawer.dart';
import 'package:flutter_mata_elang/managers/auth_manager.dart';
import 'package:flutter_mata_elang/model/user.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';

class SignOutPage extends StatefulWidget {

  SignOutPage({Key key}) : super(key: key);

  @override
  _SignOutPageState createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {

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
                  Text('Apakah anda yakin ingin keluar dari akun anda?', style:Style.h5.copyWith(color: Style.darkindigo)),
                  Text('Anda boleh keluar dari akun jika ingin menggunakan akun anda di HP lain\n\nSebelum login di HP yang baru silakan klik tombol logout dulu agar HP anda bisa menggunakan akun anda.', style:Style.body2.copyWith(color: Style.slategrey)),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0, right: 100.0),
                    child: StreamBuilder<bool>(
                      stream: getIt.get<AuthManager>().delSession,
                      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        print(snapshot);
                        if(snapshot.hasData && snapshot.data) {
                          WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SignInPage())));
                        }
                        return PrimaryButton(
                          label: 'Logout Akun', 
//                          onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignInPage()))
                          onPressed: (context) => getIt.get<AuthManager>().delSession.execute(),
                        );
                      }
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
