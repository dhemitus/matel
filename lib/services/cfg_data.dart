import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class CfgData {

  Future<bool> setFontSize(double value) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.setDouble('font', value);
  }

  Future<double> getFontSize() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    double value = _storage.getDouble('font') ?? 1.0;
    print(value);
    return value;
  }

  Future<bool> setKeySize(double value) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.setDouble('key', value);
  }

  Future<double> getKeySize() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    double value = _storage.getDouble('key') ?? 1.0;
    print(value);
    return value;
  }
}