import 'package:multivender_ecommerce_app/Models/ProductModel.dart';
import 'package:multivender_ecommerce_app/Models/UserModel.dart';

import 'StatusModel.dart';


class OrderModel{
  OrderModel({
    this.product,
    this.user,
    this.quantity,
    this.status,
    this.comment,
    this.totalPrice
});

  ProductModel product;
  UserModel user;
  int quantity;
  Status status;
  DateTime orderingDate = DateTime.now();
  String comment;
  double totalPrice;

}