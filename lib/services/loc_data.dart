import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class LocData {
  Future<Position> getPosition() async {
    Position position;

    try {
      final Geolocator geolocator = Geolocator()
        ..forceAndroidLocationManager = true;
      position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);

    print(position);

    } on PlatformException {
      position = null;
    }

    return position;
  }

}