import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/text_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/primary_button.dart';
import 'package:flutter_mata_elang/pages/signup_page.dart';
import 'package:flutter_mata_elang/pages/search_page.dart';
import 'package:flutter_mata_elang/managers/auth_manager.dart';
import 'package:flutter_mata_elang/model/user.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';

class SignInPage extends StatefulWidget {

  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool _hide;
  String _email;
  String _password;
  int _code;
  bool _open = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();


  _setEmail() => _email =  _emailController.text;
  _setPassword() => _password =  _passwordController.text;

  _setSubmit() {
    _open = true;
    User _user = User(
      email: _email,
      password: _password
    );
    getIt.get<AuthManager>().signin.execute(_user);
  }

  @override
  void initState() {
    _hide = true;
    _emailController.addListener(_setEmail);
    _passwordController.addListener(_setPassword);

    super.initState();
  }

  Future<void> _showDialog(String val) async {
    _open = false;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR!', style: Style.subTitle1.copyWith(color: Style.darkindigo)),
          content: Text(val, style: Style.subTitle1.copyWith(color: Style.oldred)),
          actions: <Widget>[
            TextButton(
              text: Text('tutup', style:Style.button.copyWith(color: Style.oldred)),
              onPressed: (context) {
                Navigator.of(context).pop();
                _code = 0;
              }
            ),
          ],
        );
      }
    );
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
                    controller: _emailController,
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
                    controller: _passwordController,
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
                  onPressed: (context) => _setSubmit()
//                  onPressed: (context) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage()))
                ),
                StreamBuilder<http.Response>(
                  stream: getIt.get<AuthManager>().signin,
                  builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
                    if(snapshot.hasData) {
                      _code = snapshot.data.statusCode;
                      if(_code == 404 && _open == true) {
                        WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog(snapshot.data.body));
                      } else if(_code == 200) {
//                        print('hasil: ' + snapshot.data.body);
//                        getIt.get<AuthManager>().signinLog.execute(snapshot.data.body);
                        WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage())));
                      }
//                      print(snapshot.data.statusCode);
                    }
                    return StreamBuilder<bool>(
                      stream: getIt.get<AuthManager>().signinLog,
                      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        return Container();
                      }
                    );
                  }
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
                        onPressed: (context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUpPage()))
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

  void _callback(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
