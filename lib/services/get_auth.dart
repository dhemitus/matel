import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
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

    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    val.fcmid = await _firebaseMessaging.getToken();
//    print(val.toMap());

    SharedPreferences _storage = await SharedPreferences.getInstance();
    _storage.setString('token', val.fcmid);

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

  Future<bool> delLog() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.setStringList('logs', null);
  }

  Future<List<String>> getLog() async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      return _storage.getStringList('logs') ?? null;

    } catch (e) {
      return null;
    }
  }

  Future<String> getToken() async {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    String _token = await _firebaseMessaging.getToken();

    SharedPreferences _storage = await SharedPreferences.getInstance();
    _storage.setString('token', _token);

    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      return _storage.getString('token') ?? null;

    } catch (e) {
      return null;
    }
  }
}