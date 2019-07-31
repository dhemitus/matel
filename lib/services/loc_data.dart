import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/services/get_auth.dart';

class LocData {
  Future<Position> getPosition() async {
    Position position;

    try {
      final Geolocator geolocator = Geolocator()
        ..forceAndroidLocationManager = true;
      position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);

    } on PlatformException {
      position = null;
    }

    return position;
  }

  Future<dynamic> setPosition(String plate) async {
    Position pos = await getIt.get<LocData>().getPosition();
    List<String> _rec = await getIt.get<GetAuth>().getLog();

    const url = 'http://newgomatel.com/apiica/user/save_tracking';

    DateTime _date = DateTime.now();
    String _now = '${_date.year}-${_date.month}-${_date.day} ${_date.hour}:${_date.minute}:${_date.second}';

    Map<String, dynamic> _map = {'waktu': _now, 'nopol': plate, 'user_id': _rec[0], 'longitude': pos.longitude.toString(), 'latitude': pos.latitude.toString()};

    http.Response response = await http.post(
      url, 
      body:_map,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${_rec[4]}'
      }
    );

//    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');
  }

}