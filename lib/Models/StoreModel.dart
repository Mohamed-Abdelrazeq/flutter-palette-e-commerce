import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/OrderModel.dart';
import 'package:multivender_ecommerce_app/Models/OwnerModel.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';

class StoreModel{
  StoreModel({
    @required this.name,
    @required this.bio,
    @required this.owner,
    @required this.shippingCost,
});

  String name;
  String bio;
  OwnerModel owner;
  List<OrderModel> orders = [];
  List<Category> categories = [];
  List<ProductModel> products = [];
  double shippingCost;

}