import 'package:dio/dio.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:flutter_mata_elang/model/user.dart';

class GetAuth {

  Future<dynamic> signin (User val) async {
    const url = 'http://newgomatel.com/apiica/auth/sign_user';
    val.imei = await ImeiPlugin.getImei;

    Dio _dio = new Dio();
    Response _data = await _dio.post(url, data: val.toMap());
    return _data;
  }


  Future<dynamic> signup (Register val) async {
    const url = 'http://newgomatel.com/apiica/regist/save_user';
    val.imei = await ImeiPlugin.getImei;
    FormData _formdata = new FormData();

    Dio _dio = new Dio();
    Response _data = await _dio.post(url, data: val.toMap());
    return _data;
  }
}