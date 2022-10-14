import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

//gets device location
class GeoLocatorService {
  Future<Position> getLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
