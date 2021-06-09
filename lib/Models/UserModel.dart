import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';

import 'OrderModel.dart';
import 'RateModel.dart';

class UserModel {

  UserModel({
    @required this.name,
    @required this.mail,
    @required this.mobile,
    @required this.lat,
    @required this.lon,
  });

  String name;
  String mail;
  String mobile;
  double lat;
  double lon;
  List<ProductModel> favourite = [];
  List<ProductModel> cart = [];
  List<OrderModel> orders = [];
  List<RateModel> rates = [];


}