import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';
import 'package:multivender_ecommerce_app/Models/UserModel.dart';

import '../Enums.dart';

class OrderModel{
  OrderModel({
    @required this.product,
    @required this.user,
    @required this.quantity,
    @required this.status,
    @required this.comment,
    @required this.totalPrice
});

  ProductModel product;
  UserModel user;
  int quantity;
  Status status;
  DateTime orderingDate = DateTime.now();
  String comment;
  double totalPrice;

}