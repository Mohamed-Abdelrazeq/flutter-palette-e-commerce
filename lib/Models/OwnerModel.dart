import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/StoreModel.dart';

class OwnerModel {

  OwnerModel({
    @required this.name,
    @required this.lon,
    @required this.lat,
    @required this.address,
    @required this.mobile,
    @required this.mail,
});

  String name;
  StoreModel store;
  double lon;
  double lat;
  String address;
  String mobile;
  String mail;

  Map<String, dynamic> toMap() {
    return {
      "name" : name,
      "lon" : lon,
      "lat" : lat,
      "address" : address,
      "mobile" : mobile,
      "mail" : mail,
    };
  }

  OwnerModel toObject(Map json){
    return OwnerModel(name: json["name"], lon: json["lon"], lat: json["lat"], address: json["address"], mobile: json["mobile"], mail: json["json"]);
  }

}