import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/text_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/primary_button.dart';
import 'package:flutter_mata_elang/pages/signin_page.dart';

class SignUpPage extends StatefulWidget {

  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _hide;

  @override
  void initState() {
    _hide = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.verybluelight,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: Center(
              child: Text('Form Pendaftaran', style: Style.h6.copyWith(color: Style.darkindigo),)
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom:14.0),
                    child: TextFormField(
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.cloudyblue,
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.lightred,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom:14.0),
                    child: TextFormField(
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      obscureText: _hide,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        suffixIcon: MainButton(icon: _hide ? STIcon.eye : STIcon.redeye, onPressed: (context) {
                          setState(() => _hide = !_hide);
                        }),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.cloudyblue,
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.lightred,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom:14.0),
                    child: TextFormField(
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.cloudyblue,
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.lightred,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom:14.0),
                    child: TextFormField(
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Nomor HP',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.cloudyblue,
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.lightred,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom:14.0),
                    child: TextFormField(
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Kota',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.cloudyblue,
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.darkindigo,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5.0, bottom:5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Dengan mengeklik \'Daftar\', maka anda telah membaca dan setuju dengan', style:Style.body2.copyWith(color: Style.slategrey)),
                        Row(
                          children: <Widget>[
                            TextButton(
                              text: Text('Aturan', style:Style.body2.copyWith(color: Style.oldred)),
                            ),
                            Text(' dan ', style:Style.body2.copyWith(color: Style.slategrey)),
                            TextButton(
                              text: Text('Persyaratan', style:Style.body2.copyWith(color: Style.oldred)),
                            ),
                          ],
                        ),
                        Text(' yang telah kami tentukan', style:Style.body2.copyWith(color: Style.slategrey)),
                      ]
                    ),
                  ),
                  PrimaryButton(
                    label: 'Daftar', 
                    onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignInPage()))
                  ),
                ],
              ),
            ),
          Container(
            padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Text('Setelah mendaftar anda akan mendapatkan GRATIS 1 HARI penggunaan untuk mencoba aplikasi ini.', style: Style.body2.copyWith(color: Style.lightred),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
