import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocationController with ChangeNotifier{

  ////CurrentLocation////
  //Vars
  double _currentLocationLat;
  double _currentLocationLng;
  //Getters
  double get getCurrentLocationLat => _currentLocationLat;
  double get getCurrentLocationLng => _currentLocationLng;
  //Methods
  Future<Coordinates> getCurrentLatitudeAndLongitude() async {
    bool serviceEnabled;
    LocationPermission permission;
    //Get Permissions
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }
    //Get Location
    Position currentCoordinates = await Geolocator.getCurrentPosition();
    _currentLocationLat = currentCoordinates.latitude.toDouble();
    _currentLocationLng = currentCoordinates.longitude.toDouble();
    notifyListeners();
    double latitude  = currentCoordinates.latitude.toDouble();
    double longitude = currentCoordinates.longitude.toDouble();
    return Coordinates(latitude, longitude);
  }
}