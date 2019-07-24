import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_mata_elang/pages/signin_page.dart';
import 'package:flutter_mata_elang/pages/search_page.dart';
import 'package:flutter_mata_elang/managers/cfg_manager.dart';
import 'package:flutter_mata_elang/managers/auth_manager.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/style/style.dart';

class RoutePage extends StatefulWidget {

  RoutePage({Key key}) : super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {

  Widget _child;


  @override
  void initState() {
//    getIt<CfgManager>().setFontSize.execute(1.0);
//    getIt<CfgManager>().setKeySize.execute(1.0);
    Style.fontSize = 1.0;
    Style.keySize = 1.0;
    getIt<CfgManager>().getFontSize.execute();
    getIt<CfgManager>().getKeySize.execute();
    getIt<AuthManager>().logSession.execute();
    super.initState();
  }

  Future<double> _notZero(Stream<double> source) async {
    await for( double value in source) {
      if(value > 0) {
        return value;
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    getIt<AuthManager>().logSession.listen((list) {
      if(list != null && list.length > 0) {
        _child = SearchPage();
      } else {
        _child = SignInPage();
      }
    });

    return FutureBuilder(
      future: _notZero(Stream<double>.periodic(Duration(milliseconds: 50), (x) => MediaQuery.of(context).size.width)
      ),
      builder: (BuildContext context, AsyncSnapshot<double> snapshot){
        if(snapshot.hasData && snapshot.data > 0) {
          ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
          return StreamBuilder<double>(
            stream: getIt<CfgManager>().getFontSize,
            builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
              if(snapshot.hasData) {
                Style.fontSize = snapshot.data;
                print(Style.fontSize);
              }
              return StreamBuilder<double>(
                stream: getIt<CfgManager>().getKeySize,
                builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                  if(snapshot.hasData) {
                    Style.keySize = snapshot.data;
  //                  print(Style.fontSize);
                  }
                  return _child;
                }
              );
            }
          );
        } else {
          print('null media');
          return StreamBuilder<List<String>>(
            stream: getIt<AuthManager>().logSession,
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if(snapshot.hasData) {
                print(snapshot.data);
                return Container(color: Colors.white);
              } else {
                print(snapshot);
                return Container(color: Colors.white);
              }
            }
          );
        }
      }
    );
  }
}
