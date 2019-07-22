import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:flutter_mata_elang/model/user.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class GetAuth {

  Future<http.Response> signin (User val) async {
    const url = 'http://newgomatel.com/apiica/auth/sign_user';
    val.imei = await ImeiPlugin.getImei;
//    val.imei = '23432423432431';

    http.Response response = await http.post(url, body: val.toMap());
//    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');
    return response;
  }


  Future<http.Response> signup (Register val) async {
    const url = 'http://newgomatel.com/apiica/regist/save_user';
    val.imei = await ImeiPlugin.getImei;
//    print(val.toMap());

    http.Response response = await http.post(url, body: val.toMap());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  Future<bool> setLog(String value) async {
    Map<String, dynamic> _map = json.decode(value);
    List<String> _list = [];
    _list.add(_map['id']);
    _list.add(_map['username']);
    _list.add(_map['iat'].toString());
    _list.add(_map['exp'].toString());
    _list.add(_map['token']);

    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.setStringList('logs', _list);
  }

  Future<List<String>> getLog() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String> value = _storage.getStringList('logs');

    return value;
  }

}