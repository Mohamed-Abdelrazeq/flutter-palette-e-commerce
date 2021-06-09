import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/StoreModel.dart';

class OwnerModel {

  OwnerModel({
    @required this.name,
    @required this.store,
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

}