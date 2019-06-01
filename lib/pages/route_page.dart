import 'package:flutter/material.dart';
import 'package:flutter_mata_elang/pages/signin_page.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoutePage extends StatefulWidget {

  RoutePage({Key key}) : super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {

  Future<double> _notZero(Stream<double> source) async {
    await for( double value in source) {
      if(value > 0) {
        return value;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _notZero(Stream<double>.periodic(Duration(milliseconds: 50), (x) => MediaQuery.of(context).size.width)
      ),
      builder: (BuildContext context, AsyncSnapshot<double> snapshot){
        if(snapshot.hasData && snapshot.data > 0) {
          ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
          return SignInPage();
        } else {
          return Container();
        }
      }
    );
  }
}
