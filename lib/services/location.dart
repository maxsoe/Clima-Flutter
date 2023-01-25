import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // debugPrint(position.toString());
      latitude = position.latitude;
      longitude = position.longitude;
      // print('Within Location class - latitude: $latitude | longitude: $longitude');
    } catch (e) {
      debugPrint(e);
    }
  }
}
