import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/main_button.dart';
import 'package:flutter_mata_elang/widgets/text_button.dart';
import 'package:flutter_mata_elang/widgets/primary_button.dart';
import 'package:flutter_mata_elang/pages/signup_page.dart';
import 'package:flutter_mata_elang/pages/search_page.dart';

class SignInPage extends StatefulWidget {

  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

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
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              width: 120.0,
              child: Image.asset('assets/images/matel.png')
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
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
                  PrimaryButton(
                    label: 'Login', 
                    onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage()))
                  ),
                            Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Untuk pendaftar baru: ', style:Style.subTitle1.copyWith(color: Style.slategrey)),
                      TextButton(
                        text: Text('Registrasi', style:Style.button.copyWith(color: Style.oldred)),
                        onPressed: (context) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SignUpPage()))
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 560.0),
            child: Column(
              children: <Widget>[
                Text('Silakan hubungi kami jika ada pertanyaan!', style: Style.body2.copyWith(color: Style.lightred),),
                TextButton(
                  text: Text('082191443443', style: Style.body2.copyWith(color: Style.oldred),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
