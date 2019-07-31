import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/text_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/primary_button.dart';
import 'package:flutter_mata_elang/pages/signin_page.dart';
import 'package:flutter_mata_elang/managers/auth_manager.dart';
import 'package:flutter_mata_elang/model/user.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';

class SignUpPage extends StatefulWidget {

  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File _ktp;
  File _foto;
  bool _hide;
  String _email;
  String _password;
  String _noktp;
  String _nohp;
  String _nama;
  String _alamat;
  String _agency;
  String _fotoktp;
  String _fotoselfi;
  String _fcmid = '7817639614932';

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _noktpController = new TextEditingController();
  TextEditingController _nohpController = new TextEditingController();
  TextEditingController _namaController = new TextEditingController();
  TextEditingController _alamatController = new TextEditingController();
  TextEditingController _agencyController = new TextEditingController();

  _setEmail() => _email =  _emailController.text;
  _setPassword() => _password =  _passwordController.text;
  _setKtp() => _noktp =  _noktpController.text;
  _setHp() => _nohp =  _nohpController.text;
  _setNama() => _nama =  _namaController.text;
  _setAlamat() => _alamat =  _alamatController.text;
  _setAgency() => _agency =  _agencyController.text;

  _setSubmit() {
    Register _user = Register(
      date: DateTime.now().toString(),
      email: _email,
      password: _password,
      noktp: _noktp,
      nohp: _nohp,
      nama: _nama,
      alamat: _alamat,
      agency_id: _agency,
//      fcmid: _fcmid,
      fotoktp: _fotoktp,
      fotoselfi: _fotoselfi
    );
//    print(_user.toMap());
    getIt.get<AuthManager>().signup.execute(_user);

  }

  void _pickFoto() async {
    try {
      _foto = await ImagePicker.pickImage(source: ImageSource.camera);
      List<int> _fotobyte = await _foto.readAsBytes();
      _fotoselfi = 'data:image/jpeg;base64,' + base64Encode(_fotobyte);
      print(_fotoselfi);
      setState(() {});
    } catch (e) {
      print('selfie error');
    }
  }

  void _pickKtp() async {
    try {
      _foto = await ImagePicker.pickImage(source: ImageSource.camera);
      List<int> _fotobyte = await _foto.readAsBytes();
      _fotoktp = 'data:image/jpeg;base64,' + base64Encode(_fotobyte);
      print(_fotoktp);
      setState(() {});
    } catch (e) {
      print('selfie error');
    }
  }

  @override
  void initState() {
    _hide = true;
    _emailController.addListener(_setEmail);
    _passwordController.addListener(_setPassword);
    _noktpController.addListener(_setKtp);
    _nohpController.addListener(_setHp);
    _namaController.addListener(_setNama);
    _alamatController.addListener(_setAlamat);
    _agencyController.addListener(_setAgency);
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
                  Padding(
                    padding: EdgeInsets.only(bottom:14.0),
                    child: TextFormField(
                      controller: _namaController,
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        suffixIcon: MainButton(icon: _fotoselfi != null ? STIcon.redimage : STIcon.image, onPressed: (context) {
                          _pickFoto();
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
                      controller: _noktpController,
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Nomor KTP',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        suffixIcon: MainButton(icon: _fotoktp != null ? STIcon.redimage : STIcon.image, onPressed: (context) {
                          _pickKtp();
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
                      controller: _nohpController,
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
                      controller: _alamatController,
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Alamat',
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
                  Padding(
                    padding: EdgeInsets.only(bottom:14.0),
                    child: TextFormField(
                      controller: _agencyController,
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Agency',
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
                  StreamBuilder<http.Response>(
                    stream: getIt.get<AuthManager>().signup,
                    builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
                      if(snapshot.hasData) {
                        if(snapshot.data.statusCode == 200) {
                          WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.pop(context));
                        }
                      }
                      return PrimaryButton(
                        label: 'Daftar', 
                        onPressed: (context) => _setSubmit()
                      );
                    }
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
