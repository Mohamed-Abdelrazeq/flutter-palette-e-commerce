import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocationController with ChangeNotifier{

  ////CurrentLocation////
  //Vars
  double _currentLocationXAxis;
  double _currentLocationYAxis;
  //Getters
  double get getCurrentLocationXAxis => _currentLocationXAxis;
  double get getCurrentLocationYAxis => _currentLocationYAxis;
  ////LocationSelector////
  //Vars
  // double _selectedPartyLocationXAxis;
  // double _selectedPartyLocationYAxis;
  // String _partyLocationName;
  // bool   _selectionBool = false;
  // //Getters
  // bool   get getSelectionBool => _selectionBool;
  // double get getSelectedPartyLocationXAxis => _selectedPartyLocationXAxis;
  // double get getSelectedPartyLocationYAxis => _selectedPartyLocationYAxis;
  // String get getPartyLocationName => _partyLocationName;
  // //Setters
  // set setSelectedPartyLocationXAxis(selectedPartyLocationXAxis){
  //   _selectedPartyLocationXAxis = selectedPartyLocationXAxis;
  //   notifyListeners();
  // }
  // set setSelectedPartyLocationYAxis(selectedPartyLocationYAxis){
  //   _selectedPartyLocationYAxis = selectedPartyLocationYAxis;
  //   notifyListeners();
  // }
  // set setPartyLocationName(name){
  //   _partyLocationName = name;
  //   notifyListeners();
  // }
  // set setSelectionBool (bool state) {
  //   this._selectionBool = state;
  //   notifyListeners();
  // }
  //Methods
  Future<Coordinates> _getCurrentLatitudeAndLongitude() async {
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
    _currentLocationXAxis = currentCoordinates.latitude.toDouble();
    _currentLocationYAxis = currentCoordinates.longitude.toDouble();
    notifyListeners();
    double latitude  = currentCoordinates.latitude.toDouble();
    double longitude = currentCoordinates.longitude.toDouble();
    return Coordinates(latitude, longitude);
  }
  Future<String> getLocationName(Coordinates positionCoordinates) async {
    var addresses = await Geocoder.local.findAddressesFromCoordinates(positionCoordinates);
    String first;
    if(addresses.first.adminArea.split(' ')[addresses.first.adminArea.split(' ').length-1] == "Governorate"){
      first = addresses.first.adminArea.substring(0,addresses.first.adminArea.length-12);
    }else{
      first = addresses.first.adminArea;
    }
    // first =  addresses.first.adminArea;
    print(first);
    print(addresses.first.adminArea);
    return first;
  }
  Future<String> getCurrentLocation() async {
    return await getLocationName(await _getCurrentLatitudeAndLongitude());
  }
}